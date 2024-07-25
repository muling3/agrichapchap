class CartItem {
  final String name;
  final String price;
  int quantity;

  CartItem({
    required this.name,
    required this.price,
    this.quantity = 0,
  });

  double get unitPrice {
    return double.tryParse(price.replaceAll('KSh ', '').replaceAll(',', '')) ??
        0.0;
  }

  double get totalPrice {
    return unitPrice * quantity;
  }
}
