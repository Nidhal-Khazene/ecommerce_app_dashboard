import '../../features/products_management/domain/entities/product_entity.dart';

ProductEntity getDummyProduct() {
  return ProductEntity(
    reviews: [],
    expirationsMonth: 2,
    isOrganic: true,
    numberOfCalories: 100,
    unitAmount: 100,
    productName: 'fruit',
    productCode: '0000',
    productDescription: 'good fruit',
    productPrice: 25,
    isFeatured: true,
    avrRating: 0,
    ratingCount: 0,
    urlImage: null,
  );
}

List<ProductEntity> getDummyProducts() {
  return [
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
  ];
}
