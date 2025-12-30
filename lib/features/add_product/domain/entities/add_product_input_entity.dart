import 'dart:io';

class AddProductInputEntity {
  final String productName, productCode, productDescription;
  String? urlImage;
  final num productPrice;
  final File fileImage;
  final bool isFeatured;

  AddProductInputEntity({
    required this.productName,
    required this.productCode,
    required this.productDescription,
    this.urlImage,
    required this.productPrice,
    required this.fileImage,
    required this.isFeatured,
  });
}
