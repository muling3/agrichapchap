// import 'package:flutter/material.dart';
// import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
// import 'package:provider/provider.dart';
// import 'package:agrichapchap/pages/product_details.dart';
// import 'package:agrichapchap/pages/product_grid_item.dart';
// import 'package:agrichapchap/providers/create_cart_provider.dart';
// import 'package:agrichapchap/types/product.dart';
// import 'package:agrichapchap/constants/app_colors.dart';
// import 'package:agrichapchap/constants/button_styles.dart';

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
//       remainingItems: 23,
//     ),
//     Product(
//       image:
//           'https://images.unsplash.com/photo-1599297914860-1ccd36987a52?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
//       name: 'Organic Potatoes',
//       price: 'KSh 200.00',
//       description: 'Organically grown potatoes rich in nutrients.',
//       remainingItems: 10,
//     ),
//     Product(
//       image:
//           'https://images.unsplash.com/photo-1523949538449-87dd068b65e6?q=80&w=1972&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
//       name: 'Green Lettuce',
//       price: 'KSh 120.00',
//       description: 'Crisp and fresh green lettuce for healthy meals.',
//       remainingItems: 5,
//     ),
//   ];

//   final GlobalKey<SliderDrawerState> _drawerKey =
//       GlobalKey<SliderDrawerState>();

//   void _showCartItems() {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       builder: (BuildContext context) {
//         final cartProvider = Provider.of<CartProvider>(context);
//         return SizedBox(
//           height: MediaQuery.of(context).size.height * 0.9,
//           child: Column(
//             children: [
//               Text(
//                 "My Cart",
//                 style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                     color: AppColors.darkGreen, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 16.0),
//               Expanded(
//                 child: cartProvider.cartItems.isEmpty
//                     ? const Center(child: Text('Your cart is empty'))
//                     : ListView.builder(
//                         itemCount: cartProvider.cartItems.length,
//                         itemBuilder: (context, index) {
//                           final item = cartProvider.cartItems[index];
//                           return Container(
//                             margin: const EdgeInsets.only(bottom: 8.0),
//                             decoration: const BoxDecoration(
//                               border: Border(
//                                 bottom: BorderSide(
//                                   color: AppColors.lightGreen,
//                                   width: 1.0,
//                                 ),
//                               ),
//                             ),
//                             child: ListTile(
//                               title: Text(item.name),
//                               subtitle: Text(
//                                 'Price: KSh ${item.unitPrice.toStringAsFixed(2)} - Quantity: ${item.quantity}\nTotal: KSh ${item.totalPrice.toStringAsFixed(2)}',
//                               ),
//                               trailing: IconButton(
//                                 icon: Icon(Icons.remove_circle,
//                                     color: Colors.red[400]),
//                                 onPressed: () {
//                                   cartProvider.removeFromCart(item);
//                                 },
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Text(
//                   'Total Price: KSh ${cartProvider.totalCartPrice.toStringAsFixed(2)}',
//                   style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                         color: AppColors.darkGreen,
//                         fontWeight: FontWeight.bold,
//                       ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: ElevatedButton(
//                   onPressed: () {
//                     // Implement checkout functionality here
//                   },
//                   style: ButtonStyles.loginButtonStyle.copyWith(
//                     backgroundColor:
//                         WidgetStateProperty.all(Colors.yellow[800]),
//                     side: WidgetStateProperty.all(const BorderSide(
//                       color: Colors.yellow,
//                       width: 1.0,
//                     )),
//                   ),
//                   child: const Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Expanded(
//                         child: Center(
//                           child: Text('Checkout'),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(right: 8.0),
//                         child: Icon(Icons.shopping_cart_checkout_outlined,
//                             size: 24),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SliderDrawer(
//       key: _drawerKey,
//       appBar: AppBar(
//         title: const Text('Products'),
//         leading: IconButton(
//           icon: const Icon(Icons.menu),
//           onPressed: () {
//             _drawerKey.currentState?.toggle();
//           },
//         ),
//       ),
//       slider: Material(
//         child: ConstrainedBox(
//           constraints: const BoxConstraints.tightFor(width: 250),
//           child: Container(
//             color: AppColors.lightGreen,
//             padding: const EdgeInsets.symmetric(vertical: 24.0),
//             child: Column(
//               children: <Widget>[
// CircleAvatar(
//   radius: 65,
//   backgroundColor: Colors.grey,
//   child: CircleAvatar(
//     radius: 60,
//     backgroundImage: Image.network(
//             'https://images.unsplash.com/photo-1500595046743-cd271d694d30?q=80&w=2074&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D')
//         .image,
//   ),
// ),
// const SizedBox(
//   height: 20,
// ),
// const Text(
//   'John Doe',
//   textAlign: TextAlign.center,
//   style: TextStyle(
//     fontWeight: FontWeight.bold,
//     color: AppColors.black,
//   ),
// ),
// const SizedBox(
//   height: 20,
// ),
//                 ListTile(
//                   leading: const Icon(Icons.history),
//                   title: const Text('Order History'),
//                   onTap: () {
//                     // Handle order history navigation
//                   },
//                 ),
//                 const Spacer(),
//                 Container(
//                   margin: const EdgeInsets.all(16.0),
//                   alignment: Alignment.bottomCenter,
//                   child: GestureDetector(
//                     onTap: () {
//                       _drawerKey.currentState?.toggle();
//                     },
//                     child: Container(
//                       padding: const EdgeInsets.all(8.0),
//                       decoration: const BoxDecoration(
//                         color: Colors.red,
//                         shape: BoxShape.circle,
//                       ),
//                       child: const Icon(
//                         Icons.close,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       child: Scaffold(
//         body: GridView.builder(
//           padding: const EdgeInsets.all(16.0),
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             crossAxisSpacing: 16.0,
//             mainAxisSpacing: 16.0,
//             childAspectRatio: 0.75,
//           ),
//           itemCount: products.length,
//           itemBuilder: (context, index) {
//             final product = products[index];
//             return ProductGridItem(
//               image: product.image,
//               name: product.name,
//               price: product.price,
//               description: product.description,
//               remainingItems: product.remainingItems,
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => ProductDetail(
//                       image: product.image,
//                       name: product.name,
//                       price: product.price,
//                       description: product.description,
//                       remainingItems: product.remainingItems,
//                     ),
//                   ),
//                 );
//               },
//             );
//           },
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: _showCartItems,
//           backgroundColor: AppColors.darkGreen,
//           shape: const CircleBorder(
//             eccentricity: 0,
//           ),
//           child: const Icon(
//             Icons.shopping_cart_outlined,
//             color: AppColors.white,
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:agrichapchap/pages/product_details.dart';
import 'package:agrichapchap/pages/product_grid_item.dart';
import 'package:agrichapchap/providers/create_cart_provider.dart';
import 'package:agrichapchap/types/product.dart';
import 'package:flutter/material.dart';
import 'package:agrichapchap/constants/app_colors.dart';
import 'package:agrichapchap/constants/button_styles.dart';
import 'package:provider/provider.dart';

class ProductsGrid extends StatefulWidget {
  const ProductsGrid({super.key});

  @override
  State<ProductsGrid> createState() => _ProductsGridState();
}

class _ProductsGridState extends State<ProductsGrid> {
  final List<Product> products = [
    Product(
      image:
          'https://plus.unsplash.com/premium_photo-1674666545272-fa8f4acfc99b?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      name: 'Fresh Tomatoes',
      price: 'KSh 150.00',
      description: 'Fresh and juicy tomatoes perfect for your salads.',
      remainingItems: 23,
    ),
    Product(
      image:
          'https://images.unsplash.com/photo-1599297914860-1ccd36987a52?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      name: 'Organic Potatoes',
      price: 'KSh 200.00',
      description: 'Organically grown potatoes rich in nutrients.',
      remainingItems: 10,
    ),
    Product(
      image:
          'https://images.unsplash.com/photo-1523949538449-87dd068b65e6?q=80&w=1972&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      name: 'Green Lettuce',
      price: 'KSh 120.00',
      description: 'Crisp and fresh green lettuce for healthy meals.',
      remainingItems: 5,
    ),
  ];

  void _showCartItems() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        final cartProvider = Provider.of<CartProvider>(context);
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.9,
          child: Column(
            children: [
              Text(
                "My Cart",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.darkGreen, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16.0),
              Expanded(
                child: cartProvider.cartItems.isEmpty
                    ? const Center(child: Text('Your cart is empty'))
                    : ListView.builder(
                        itemCount: cartProvider.cartItems.length,
                        itemBuilder: (context, index) {
                          final item = cartProvider.cartItems[index];
                          return Container(
                            margin: const EdgeInsets.only(bottom: 8.0),
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: AppColors.lightGreen,
                                  width: 1.0,
                                ),
                              ),
                            ),
                            child: ListTile(
                              title: Text(item.name),
                              subtitle: Text(
                                'Price: KSh ${item.unitPrice.toStringAsFixed(2)}\nQuantity: ${item.quantity}\nTotal: KSh ${item.totalPrice.toStringAsFixed(2)}',
                              ),
                              trailing: IconButton(
                                icon: Icon(Icons.remove_circle,
                                    color: Colors.red[400]),
                                onPressed: () {
                                  cartProvider.removeFromCart(item);
                                },
                              ),
                            ),
                          );
                        },
                      ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Total Price: KSh ${cartProvider.totalCartPrice.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.darkGreen,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Implement checkout functionality here
                  },
                  style: ButtonStyles.loginButtonStyle.copyWith(
                    backgroundColor:
                        WidgetStateProperty.all(Colors.yellow[800]),
                    side: WidgetStateProperty.all(const BorderSide(
                      color: Colors.yellow,
                      width: 1.0,
                    )),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Center(
                          child: Text('Checkout'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Icon(Icons.shopping_cart_checkout_outlined,
                            size: 24),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: AppColors.lightGreen,
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 45,
                    backgroundColor: Colors.grey,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: Image.network(
                              'https://images.unsplash.com/photo-1500595046743-cd271d694d30?q=80&w=2074&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D')
                          .image,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'John Doe',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('My Profile'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text('Order History'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: GridView.builder(
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
            image: product.image,
            name: product.name,
            price: product.price,
            description: product.description,
            remainingItems: product.remainingItems,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetail(
                    image: product.image,
                    name: product.name,
                    price: product.price,
                    description: product.description,
                    remainingItems: product.remainingItems,
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showCartItems,
        backgroundColor: AppColors.darkGreen,
        shape: const CircleBorder(
          eccentricity: 0,
        ),
        child: const Icon(
          Icons.shopping_cart_outlined,
          color: AppColors.white,
        ),
      ),
    );
  }
}
