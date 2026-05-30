class OrderProductsEntity {
  final String productCode;
  final String productName;
  final num productPrice;
  final String imageUrl;
  final int quantity;

  OrderProductsEntity({
    required this.productCode,
    required this.productName,
    required this.productPrice,
    required this.imageUrl,
    required this.quantity,
  });
}
