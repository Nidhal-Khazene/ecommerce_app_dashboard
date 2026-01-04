import 'dart:io';

class AddProductInputEntity {
  final String productName, productCode, productDescription;
  String? urlImage;
  final num productPrice;
  final File fileImage;
  final bool isFeatured;
  final int expirationsMonth;
  final bool isOrganic;
  final int numberOfCalories;
  final num avrRating;
  final num ratingCount;

  final int unitAmount;

  AddProductInputEntity({
    this.avrRating = 0,
    this.ratingCount = 0,
    required this.expirationsMonth,
    required this.isOrganic,
    required this.numberOfCalories,
    required this.unitAmount,
    required this.productName,
    required this.productCode,
    required this.productDescription,
    this.urlImage,
    required this.productPrice,
    required this.fileImage,
    required this.isFeatured,
  });
}
