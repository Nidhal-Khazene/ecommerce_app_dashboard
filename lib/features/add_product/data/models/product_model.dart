import 'package:ecommerce_app_dashboard/features/add_product/data/models/review_model.dart';
import 'package:ecommerce_app_dashboard/features/add_product/domain/entities/product_entity.dart';

class ProductModel {
  final String productName;
  final String productCode;
  final String productDescription;
  final num productPrice;
  final bool isFeatured;
  final String? urlImage;
  final int expirationsMonth;
  final bool isOrganic;
  final int numberOfCalories;
  final num avrRating;
  final num ratingCount;
  final int unitAmount;
  final List<ReviewModel> reviews;

  ProductModel({
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
      expirationsMonth: entity.expirationsMonth,
      isOrganic: entity.isOrganic,
      numberOfCalories: entity.numberOfCalories,
      unitAmount: entity.unitAmount,
      avrRating: entity.avrRating,
      ratingCount: entity.ratingCount,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "productName": productName,
      "productCode": productCode,
      "productDescription": productDescription,
      "productPrice": productPrice,
      "isFeatured": isFeatured,
      "urlImage": urlImage,
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
