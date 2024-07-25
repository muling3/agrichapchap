// import 'package:flutter/material.dart';
// import 'package:agrichapchap/types/cart_item.dart';

// class CartProvider with ChangeNotifier {
//   final List<CartItem> _cartItems = [];

//   List<CartItem> get cartItems => _cartItems;

//   void addToCart(CartItem item) {
//     final existingItem = _cartItems.firstWhere(
//       (cartItem) => cartItem.name == item.name,
//       orElse: () => CartItem(name: '', price: '', quantity: 0),
//     );

//     if (existingItem.name.isNotEmpty) {
//       existingItem.quantity += item.quantity;
//     } else {
//       _cartItems.add(item);
//     }
//     notifyListeners();
//   }

//   void removeFromCart(CartItem item) {
//     _cartItems.remove(item);
//     notifyListeners();
//   }
// }
import 'package:flutter/material.dart';
import 'package:agrichapchap/types/cart_item.dart';

class CartProvider with ChangeNotifier {
  final List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  void addToCart(CartItem item) {
    final existingItem = _cartItems.firstWhere(
      (cartItem) => cartItem.name == item.name,
      orElse: () => CartItem(name: '', price: '', quantity: 0),
    );

    if (existingItem.name.isNotEmpty) {
      existingItem.quantity += item.quantity;
    } else {
      _cartItems.add(item);
    }
    notifyListeners();
  }

  void removeFromCart(CartItem item) {
    _cartItems.remove(item);
    notifyListeners();
  }

  double get totalCartPrice {
    return _cartItems.fold(0.0, (sum, item) => sum + item.totalPrice);
  }
}
