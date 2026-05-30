import '../../domain/entities/shipping_address_entity.dart';

class ShippingAddressModel {
  int? id;
  String? fullName;
  String? email;
  String? address;
  String? city;
  int? apartmentNumber;

  ShippingAddressModel({
    this.fullName,
    this.id,
    this.email,
    this.address,
    this.city,
    this.apartmentNumber,
  });

  factory ShippingAddressModel.fromJson(Map<String, dynamic> json) {
    return ShippingAddressModel(
      id: json["id"],
      fullName: json["fullName"],
      email: json["email"],
      address: json["address"],
      city: json["city"],
      apartmentNumber: json["apartmentNumber"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "fullName": fullName,
      "email": email,
      "address": address,
      "city": city,
      "apartmentNumber": apartmentNumber,
    };
  }

  ShippingAddressEntity toEntity() {
    return ShippingAddressEntity(
      id: id,
      fullName: fullName,
      email: email,
      address: address,
      city: city,
      apartmentNumber: apartmentNumber,
    );
  }
}
