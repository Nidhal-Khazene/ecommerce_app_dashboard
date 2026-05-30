import 'package:ecommerce_app_dashboard/features/products_management/data/models/review_model.dart';
import 'package:ecommerce_app_dashboard/features/products_management/domain/entities/product_entity.dart';

class ProductModel {
  final String productName;
  final String productCode;
  final String productDescription;
  final num productPrice;
  final bool isFeatured;
  final String? urlImage;
  final String? imagePath;
  final int expirationsMonth;
  final bool isOrganic;
  final int numberOfCalories;
  final num avrRating;
  final num ratingCount;
  final int unitAmount;
  final List<ReviewModel> reviews;
  final int sellingCount;

  ProductModel({
    this.imagePath,
    this.sellingCount = 0,
    required this.reviews,
    this.avrRating = 0,
    this.ratingCount = 0,
    required this.expirationsMonth,
    this.isOrganic = false,
    required this.numberOfCalories,
    required this.unitAmount,
    required this.productName,
    required this.productCode,
    required this.productDescription,
    required this.productPrice,
    this.isFeatured = false,
    this.urlImage,
  });

  factory ProductModel.fromEntity(ProductEntity entity) {
    return ProductModel(
      reviews: entity.reviews.map((e) => ReviewModel.fromEntity(e)).toList(),
      productName: entity.productName,
      productCode: entity.productCode,
      productDescription: entity.productDescription,
      productPrice: entity.productPrice,
      isFeatured: entity.isFeatured,
      urlImage: entity.urlImage,
      imagePath: entity.imagePath,
      expirationsMonth: entity.expirationsMonth,
      isOrganic: entity.isOrganic,
      numberOfCalories: entity.numberOfCalories,
      unitAmount: entity.unitAmount,
      avrRating: entity.avrRating,
      ratingCount: entity.ratingCount,
    );
  }

  ProductEntity toEntity() {
    return ProductEntity(
      reviews: reviews.map((e) => e.toEntity()).toList(),
      expirationsMonth: expirationsMonth,
      isOrganic: isOrganic,
      numberOfCalories: numberOfCalories,
      unitAmount: unitAmount,
      productName: productName,
      productCode: productCode,
      productDescription: productDescription,
      productPrice: productPrice,
      urlImage: urlImage,
      imagePath: imagePath,
      isFeatured: isFeatured,
    );
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      sellingCount: json["sellingCount"] ?? 0,
      reviews: json["reviews"] != null
          ? List<ReviewModel>.from(
              json["reviews"].map((e) => ReviewModel.fromJson(e)),
            )
          : [],
      expirationsMonth: json["expirationsMonth"] ?? 0,
      numberOfCalories: json["numberOfCalories"] ?? 0,
      unitAmount: json["unitAmount"] ?? 0,
      productName: json["productName"] ?? '',
      productCode: json["productCode"] ?? '',
      productDescription: json["productDescription"] ?? '',
      productPrice: json["productPrice"] ?? 0,
      isFeatured: json["isFeatured"] ?? false,
      urlImage: json["urlImage"],
      imagePath: json["imagePath"],
      isOrganic: json["isOrganic"] ?? false,
      avrRating: json["avrRating"] ?? 0,
      ratingCount: json["ratingCount"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "sellingCount": sellingCount,
      "productName": productName,
      "productCode": productCode,
      "productDescription": productDescription,
      "productPrice": productPrice,
      "isFeatured": isFeatured,
      "urlImage": urlImage,
      "imagePath": imagePath,
      "expirationsMonth": expirationsMonth,
      "isOrganic": isOrganic,
      "numberOfCalories": numberOfCalories,
      "unitAmount": unitAmount,
      "avrRating": avrRating,
      "ratingCount": ratingCount,
      "reviews": reviews.map((e) => e.toJson()).toList(),
    };
  }
}
