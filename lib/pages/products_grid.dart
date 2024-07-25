import 'package:agrichapchap/constants/app_colors.dart';
import 'package:agrichapchap/constants/button_styles.dart';
import 'package:agrichapchap/constants/form_field_decoration.dart';
import 'package:agrichapchap/pages/product_grid_item.dart';
import 'package:flutter/material.dart';

class ProductsGrid extends StatefulWidget {
  const ProductsGrid({super.key});

  @override
  State<ProductsGrid> createState() => _ProductsGridState();
}

class _ProductsGridState extends State<ProductsGrid> {
  final List<Map<String, String>> products = [
    {
      'image':
          'https://plus.unsplash.com/premium_photo-1674666545272-fa8f4acfc99b?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'name': 'Fresh Tomatoes',
      'price': 'KSh 150.00',
    },
    {
      'image':
          'https://images.unsplash.com/photo-1599297914860-1ccd36987a52?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'name': 'Organic Potatoes',
      'price': 'KSh 200.00',
    },
    {
      'image':
          'https://images.unsplash.com/photo-1523949538449-87dd068b65e6?q=80&w=1972&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'name': 'Green Lettuce',
      'price': 'KSh 120.00',
    },
  ];

  void _showProductForm() {
    final formKey = GlobalKey<FormState>();
    final productQuantityController = TextEditingController();
    final productPriceController = TextEditingController();

    String? selectedProductType;
    String? selectedUnitOfMeasurement;

    final List<String> productTypes = ["Maize", "Vegetables", "Beans"];
    final List<String> unitOfMeasurements = ["Grams", "Kilograms", "Litres"];

    void onProductTypeChanged(String? val) {
      setState(() {
        selectedProductType = val;
      });
    }

    void onUnitOfMeasurementChanged(String? val) {
      setState(() {
        selectedUnitOfMeasurement = val;
      });
    }

    final media = MediaQuery.of(context).size;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SizedBox(
          height: media.height * 0.5,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropdownButtonFormField<String>(
                    value: selectedProductType,
                    decoration: formFieldDecoration("Product"),
                    items: productTypes.map((pd) {
                      return DropdownMenuItem<String>(
                        value: pd,
                        child: Text(pd),
                      );
                    }).toList(),
                    onChanged: onProductTypeChanged,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a product';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  DropdownButtonFormField<String>(
                    value: selectedUnitOfMeasurement,
                    decoration: formFieldDecoration("Unit of measurement"),
                    items: unitOfMeasurements.map((um) {
                      return DropdownMenuItem<String>(
                        value: um,
                        child: Text(um),
                      );
                    }).toList(),
                    onChanged: onUnitOfMeasurementChanged,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a unit of measurement';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: productQuantityController,
                    decoration: formFieldDecoration("Quantity"),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the product quantity';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: productPriceController,
                    decoration: formFieldDecoration("Price"),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the product price';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.pop(context);
                      }
                    },
                    style: ButtonStyles.loginButtonStyle,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Center(
                            child: Text('Add Product'),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child:
                              Icon(Icons.add_circle_outline_rounded, size: 24),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GridView.builder(
          padding: const EdgeInsets.all(16.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 0.75,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return ProductGridItem(
              image: product['image']!,
              name: product['name']!,
              price: product['price']!,
              description: "",
              remainingItems: 20,
              onTap: () {},
            );
          },
        ),
        Positioned(
          bottom: 16.0,
          right: 16.0,
          child: FloatingActionButton(
            onPressed: _showProductForm,
            backgroundColor: AppColors.darkGreen,
            shape: const CircleBorder(
              eccentricity: 0,
            ),
            child: const Icon(
              Icons.add,
              color: AppColors.white,
            ),
          ),
        ),
      ],
    );
  }
}
// import 'package:agrichapchap/constants/app_colors.dart';
// import 'package:agrichapchap/constants/button_styles.dart';
// import 'package:agrichapchap/constants/form_field_decoration.dart';
// import 'package:agrichapchap/pages/product_grid_item.dart';
// import 'package:agrichapchap/types/product.dart';
// import 'package:flutter/material.dart';

// class ProductsGrid extends StatefulWidget {
//   const ProductsGrid({super.key});

//   @override
//   State<ProductsGrid> createState() => _ProductsGridState();
// }

// class _ProductsGridState extends State<ProductsGrid> {
//   final List<Product> products = [
//     Product(
//       image:
//           'https://plus.unsplash.com/premium_photo-1674666545272-fa8f4acfc99b?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
//       name: 'Fresh Tomatoes',
//       price: 'KSh 150.00',
//       description: 'Fresh and juicy tomatoes perfect for your salads.',
//     ),
//     Product(
//       image:
//           'https://images.unsplash.com/photo-1599297914860-1ccd36987a52?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
//       name: 'Organic Potatoes',
//       price: 'KSh 200.00',
//       description: 'Organically grown potatoes rich in nutrients.',
//     ),
//     Product(
//       image:
//           'https://images.unsplash.com/photo-1523949538449-87dd068b65e6?q=80&w=1972&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
//       name: 'Green Lettuce',
//       price: 'KSh 120.00',
//       description: 'Crisp and fresh green lettuce for healthy meals.',
//     ),
//   ];

//   void _showProductForm() {
//     final formKey = GlobalKey<FormState>();
//     final productQuantityController = TextEditingController();
//     final productPriceController = TextEditingController();

//     String? selectedProductType;
//     String? selectedUnitOfMeasurement;

//     final List<String> productTypes = ["Maize", "Vegetables", "Beans"];
//     final List<String> unitOfMeasurements = ["Grams", "Kilograms", "Litres"];

//     void onProductTypeChanged(String? val) {
//       setState(() {
//         selectedProductType = val;
//       });
//     }

//     void onUnitOfMeasurementChanged(String? val) {
//       setState(() {
//         selectedUnitOfMeasurement = val;
//       });
//     }

//     final media = MediaQuery.of(context).size;

//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       builder: (BuildContext context) {
//         return SizedBox(
//           height: media.height * 0.5,
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Form(
//               key: formKey,
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   DropdownButtonFormField<String>(
//                     value: selectedProductType,
//                     decoration: formFieldDecoration("Product"),
//                     items: productTypes.map((pd) {
//                       return DropdownMenuItem<String>(
//                         value: pd,
//                         child: Text(pd),
//                       );
//                     }).toList(),
//                     onChanged: onProductTypeChanged,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please select a product';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 16.0),
//                   DropdownButtonFormField<String>(
//                     value: selectedUnitOfMeasurement,
//                     decoration: formFieldDecoration("Unit of measurement"),
//                     items: unitOfMeasurements.map((um) {
//                       return DropdownMenuItem<String>(
//                         value: um,
//                         child: Text(um),
//                       );
//                     }).toList(),
//                     onChanged: onUnitOfMeasurementChanged,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please select a unit of measurement';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 16.0),
//                   TextFormField(
//                     controller: productQuantityController,
//                     decoration: formFieldDecoration("Quantity"),
//                     keyboardType: TextInputType.number,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter the product quantity';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 16.0),
//                   TextFormField(
//                     controller: productPriceController,
//                     decoration: formFieldDecoration("Price"),
//                     keyboardType: TextInputType.number,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter the product price';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 16.0),
//                   ElevatedButton(
//                     onPressed: () {
//                       if (formKey.currentState!.validate()) {
//                         Navigator.pop(context);
//                       }
//                     },
//                     style: ButtonStyles.loginButtonStyle,
//                     child: const Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Expanded(
//                           child: Center(
//                             child: Text('Add Product'),
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.only(right: 8.0),
//                           child:
//                               Icon(Icons.add_circle_outline_rounded, size: 24),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Products'),
//       ),
//       body: GridView.builder(
//         padding: const EdgeInsets.all(16.0),
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 16.0,
//           mainAxisSpacing: 16.0,
//           childAspectRatio: 0.75,
//         ),
//         itemCount: products.length,
//         itemBuilder: (context, index) {
//           final product = products[index];
//           return ProductGridItem(
//             image: product.image,
//             name: product.name,
//             price: product.price,
//             description: product.description,
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _showProductForm,
//         backgroundColor: AppColors.darkGreen,
//         shape: const CircleBorder(
//           eccentricity: 0,
//         ),
//         child: const Icon(
//           Icons.add,
//           color: AppColors.white,
//         ),
//       ),
//     );
//   }
// }
