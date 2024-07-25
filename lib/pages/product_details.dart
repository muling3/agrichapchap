// import 'package:agrichapchap/constants/app_colors.dart';
// import 'package:agrichapchap/constants/button_styles.dart';
// import 'package:agrichapchap/constants/form_field_decoration.dart';
// import 'package:flutter/material.dart';
// import 'package:toastification/toastification.dart';

// class ProductDetail extends StatefulWidget {
//   final String image;
//   final String name;
//   final String price;
//   final String description;
//   final int remainingItems;

//   const ProductDetail({
//     super.key,
//     required this.image,
//     required this.name,
//     required this.price,
//     required this.description,
//     required this.remainingItems,
//   });

//   @override
//   _ProductDetailState createState() => _ProductDetailState();
// }

// class _ProductDetailState extends State<ProductDetail> {
//   final TextEditingController _quantityController = TextEditingController();
//   double _estimatedPrice = 0.0;
//   int _maxQuantity = 0;

//   @override
//   void initState() {
//     super.initState();
//     _updateEstimatedPrice();
//     _maxQuantity = (widget.remainingItems / 2).floor();
//   }

//   void _updateEstimatedPrice() {
//     final double unitPrice = double.tryParse(
//             widget.price.replaceAll('KSh ', '').replaceAll(',', '')) ??
//         0.0;
//     final int quantity = int.tryParse(_quantityController.text) ?? 0;
//     setState(() {
//       _estimatedPrice = unitPrice * quantity;
//     });
//   }

//   void _showQuantityBottomSheet() {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       builder: (BuildContext context) {
//         return Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const Text(
//                 "Add to Cart",
//               ),
//               const SizedBox(height: 16.0),
//               Text(
//                 'Remaining items: ${widget.remainingItems}',
//                 style: Theme.of(context).textTheme.bodySmall,
//               ),
//               const SizedBox(height: 16.0),
//               TextField(
//                 controller: _quantityController,
//                 keyboardType: TextInputType.number,
//                 decoration: formFieldDecoration("Quantity"),
//                 onChanged: (_) => _updateEstimatedPrice(),
//               ),
//               const SizedBox(height: 16.0),
//               Text(
//                 'Estimated Price: KSh ${_estimatedPrice.toStringAsFixed(2)}',
//                 style: Theme.of(context).textTheme.bodySmall,
//               ),
//               const SizedBox(height: 16.0),
//               Text(
//                 'Max Quantity: $_maxQuantity',
//                 style: Theme.of(context)
//                     .textTheme
//                     .bodySmall
//                     ?.copyWith(color: Colors.red),
//               ),
//               const SizedBox(height: 24.0),
//               ElevatedButton(
//                 onPressed: () {
//                   final int quantity =
//                       int.tryParse(_quantityController.text) ?? 0;
//                   if (quantity > _maxQuantity) {
//                     toastification.show(
//                       title: Text('Cannot add more than $_maxQuantity items.'),
//                       type: ToastificationType.error,
//                       style: ToastificationStyle.minimal,
//                       dragToClose: true,
//                       borderRadius: BorderRadius.circular(12),
//                       autoCloseDuration: const Duration(seconds: 5),
//                       showProgressBar: false,
//                     );
//                   } else {
//                     // Implement add to cart functionality here
//                     Navigator.pop(context);
//                   }
//                 },
//                 style: ButtonStyles.loginButtonStyle.copyWith(
//                   backgroundColor: WidgetStateProperty.all(Colors.red[400]),
//                 ),
//                 child: const Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Expanded(
//                       child: Center(
//                         child: Text('Add to Cart'),
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(right: 8.0),
//                       child: Icon(Icons.add_shopping_cart_rounded, size: 24),
//                     ),
//                   ],
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
//     var media = MediaQuery.of(context).size;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.name),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ClipRRect(
//               borderRadius: const BorderRadius.only(
//                 bottomLeft: Radius.circular(20.0),
//                 bottomRight: Radius.circular(20.0),
//               ),
//               child: Hero(
//                 tag: 'product-image-${widget.name}',
//                 child: Image.network(
//                   widget.image,
//                   height: MediaQuery.of(context).size.height * 0.55,
//                   width: double.infinity,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     widget.name,
//                     style: Theme.of(context).textTheme.bodyLarge,
//                   ),
//                   const SizedBox(height: 8.0),
//                   Text(
//                     widget.price,
//                     style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                           color: AppColors.darkGreen,
//                         ),
//                   ),
//                   const SizedBox(height: 8.0),
//                   Text(
//                     'Remaining items: ${widget.remainingItems}',
//                     style: Theme.of(context)
//                         .textTheme
//                         .bodySmall
//                         ?.copyWith(color: Colors.red),
//                   ),
//                   const SizedBox(height: 16.0),
//                   Text(
//                     widget.description,
//                     style: Theme.of(context).textTheme.bodySmall,
//                   ),
//                   const SizedBox(height: 24.0),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       SizedBox(
//                         width: media.width * 0.4,
//                         child: ElevatedButton(
//                           onPressed: () {
//                             // Implement buy now functionality here
//                           },
//                           style: ButtonStyles.loginButtonStyle.copyWith(
//                             backgroundColor:
//                                 WidgetStateProperty.all(Colors.red[400]),
//                             side: WidgetStateProperty.all(const BorderSide(
//                               color: Colors.red,
//                               width: 1.0,
//                             )),
//                           ),
//                           child: const Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Expanded(
//                                 child: Center(
//                                   child: Text('Buy Now'),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(right: 8.0),
//                                 child: Icon(Icons.shopping_basket_rounded,
//                                     size: 24),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         width: media.width * 0.4,
//                         child: ElevatedButton(
//                           onPressed: _showQuantityBottomSheet,
//                           style: ButtonStyles.loginButtonStyle,
//                           child: const Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Expanded(
//                                 child: Center(
//                                   child: Text('Add to Cart'),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(right: 8.0),
//                                 child: Icon(Icons.add_shopping_cart_rounded,
//                                     size: 24),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:agrichapchap/providers/create_cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:agrichapchap/constants/app_colors.dart';
import 'package:agrichapchap/constants/button_styles.dart';
import 'package:agrichapchap/constants/form_field_decoration.dart';
import 'package:agrichapchap/types/cart_item.dart';
import 'package:toastification/toastification.dart';

class ProductDetail extends StatefulWidget {
  final String image;
  final String name;
  final String price;
  final String description;
  final int remainingItems;

  const ProductDetail({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.description,
    required this.remainingItems,
  });

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  final TextEditingController _quantityController = TextEditingController();
  double _estimatedPrice = 0.0;
  int _maxQuantity = 0;

  @override
  void initState() {
    super.initState();
    _updateEstimatedPrice();
    _maxQuantity = (widget.remainingItems / 2).floor();
  }

  void _updateEstimatedPrice() {
    final double unitPrice = double.tryParse(
            widget.price.replaceAll('KSh ', '').replaceAll(',', '')) ??
        0.0;
    final int quantity = int.tryParse(_quantityController.text) ?? 0;
    setState(() {
      _estimatedPrice = unitPrice * quantity;
    });
  }

  void _showQuantityBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Add to Cart"),
              const SizedBox(height: 16.0),
              Text(
                'Remaining items: ${widget.remainingItems}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _quantityController,
                keyboardType: TextInputType.number,
                decoration: formFieldDecoration("Quantity"),
                onChanged: (_) => _updateEstimatedPrice(),
              ),
              const SizedBox(height: 16.0),
              Text(
                'Estimated Price: KSh ${_estimatedPrice.toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 16.0),
              Text(
                'Max Quantity: $_maxQuantity',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Colors.red),
              ),
              const SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () {
                  final int quantity =
                      int.tryParse(_quantityController.text) ?? 0;
                  if (quantity > _maxQuantity) {
                    toastification.show(
                      title: Text('Cannot add more than $_maxQuantity items.'),
                      type: ToastificationType.error,
                      style: ToastificationStyle.minimal,
                      dragToClose: true,
                      borderRadius: BorderRadius.circular(12),
                      autoCloseDuration: const Duration(seconds: 5),
                      showProgressBar: false,
                    );
                  } else {
                    final cartItem = CartItem(
                      name: widget.name,
                      price: widget.price,
                      quantity: quantity,
                    );
                    Provider.of<CartProvider>(context, listen: false)
                        .addToCart(cartItem);
                    Navigator.pop(context);
                    toastification.show(
                      title: Text('$quantity ${widget.name} added to cart.'),
                      type: ToastificationType.success,
                      style: ToastificationStyle.minimal,
                      dragToClose: true,
                      borderRadius: BorderRadius.circular(12),
                      autoCloseDuration: const Duration(seconds: 5),
                      showProgressBar: false,
                    );
                  }
                },
                style: ButtonStyles.loginButtonStyle.copyWith(
                  backgroundColor: WidgetStateProperty.all(Colors.red[400]),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Center(
                        child: Text('Add to Cart'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Icon(Icons.add_shopping_cart_rounded, size: 24),
                    ),
                  ],
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
    var media = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
              child: Hero(
                tag: 'product-image-${widget.name}',
                child: Image.network(
                  widget.image,
                  height: MediaQuery.of(context).size.height * 0.55,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    widget.price,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.darkGreen,
                        ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Remaining items: ${widget.remainingItems}',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: Colors.red),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    widget.description,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 24.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: media.width * 0.4,
                        child: ElevatedButton(
                          onPressed: () {
                            // Implement buy now functionality here
                          },
                          style: ButtonStyles.loginButtonStyle.copyWith(
                            backgroundColor:
                                WidgetStateProperty.all(Colors.red[400]),
                            side: WidgetStateProperty.all(const BorderSide(
                              color: Colors.red,
                              width: 1.0,
                            )),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Center(
                                  child: Text('Buy Now'),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 8.0),
                                child: Icon(Icons.shopping_basket_rounded,
                                    size: 24),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: media.width * 0.4,
                        child: ElevatedButton(
                          onPressed: _showQuantityBottomSheet,
                          style: ButtonStyles.loginButtonStyle,
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Center(
                                  child: Text('Add to Cart'),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 8.0),
                                child: Icon(Icons.add_shopping_cart_rounded,
                                    size: 24),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
