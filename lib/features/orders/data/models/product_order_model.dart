import '../../domain/entities/product_order_entity.dart';

class OrderProductsModel {
  final String productCode;
  final String productName;
  final num productPrice;
  final String imageUrl;
  final int quantity;

  OrderProductsModel({
    required this.productCode,
    required this.productName,
    required this.productPrice,
    required this.imageUrl,
    required this.quantity,
  });

  factory OrderProductsModel.fromJson(Map<String, dynamic> json) {
    return OrderProductsModel(
      productCode: json["productCode"],
      productName: json["productName"],
      productPrice: json["productPrice"],
      imageUrl: json["imageUrl"],
      quantity: json["quantity"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "productCode": productCode,
      "productName": productName,
      "productPrice": productPrice,
      "imageUrl": imageUrl,
      "quantity": quantity,
    };
  }

  OrderProductsEntity toEntity() {
    return OrderProductsEntity(
      productCode: productCode,
      productName: productName,
      productPrice: productPrice,
      imageUrl: imageUrl,
      quantity: quantity,
    );
  }
}
