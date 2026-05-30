import '../../domain/entities/payment_card_entity.dart';

class PaymentCardModel {
  final String name;
  final String cardNumber;
  final String expirationCard;
  final String cvv;

  PaymentCardModel({
    required this.name,
    required this.cardNumber,
    required this.expirationCard,
    required this.cvv,
  });

  factory PaymentCardModel.fromJson(Map<String, dynamic> json) =>
      PaymentCardModel(
        name: json["name"],
        cardNumber: json["cardNumber"],
        expirationCard: json["expirationCard"],
        cvv: json["cvv"],
      );

  Map<String, dynamic> toJson() => {
    "name": name,
    "cardNumber": cardNumber,
    "expirationCard": expirationCard,
    "cvv": cvv,
  };

  PaymentCardEntity toEntity() {
    return PaymentCardEntity(
      name: name,
      cardNumber: cardNumber,
      expirationCard: expirationCard,
      cvv: cvv,
    );
  }
}
