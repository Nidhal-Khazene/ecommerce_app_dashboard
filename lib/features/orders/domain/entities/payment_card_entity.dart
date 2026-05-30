class PaymentCardEntity {
  final String name;
  final String cardNumber;
  final String expirationCard;
  final String cvv;

  PaymentCardEntity({
    required this.name,
    required this.cardNumber,
    required this.expirationCard,
    required this.cvv,
  });
}
