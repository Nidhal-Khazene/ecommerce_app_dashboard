class ShippingAddressEntity {
  int? id;
  String? fullName;
  String? email;
  String? address;
  String? city;
  int? apartmentNumber;

  ShippingAddressEntity({
    this.fullName,
    this.id,
    this.email,
    this.address,
    this.city,
    this.apartmentNumber,
  });

  String addressToString() => "$apartmentNumber,$city,$address";
}
