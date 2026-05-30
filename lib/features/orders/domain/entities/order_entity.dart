import 'package:ecommerce_app_dashboard/core/enums/order_status_enum.dart';
import 'package:ecommerce_app_dashboard/features/orders/domain/entities/payment_card_entity.dart';
import 'package:ecommerce_app_dashboard/features/orders/domain/entities/product_order_entity.dart';
import 'package:ecommerce_app_dashboard/features/orders/domain/entities/shipping_address_entity.dart';

class OrderEntity {
  final double totalPrice;
  final String orderID;
  final String uID;
  final ShippingAddressEntity shippingAddressEntity;
  final List<OrderProductsEntity> orderProducts;
  final PaymentCardEntity paymentCardEntity;
  final String paymentMethod;
  final OrderStatusEnum status;
  final String date;

  OrderEntity({
    required this.orderID,
    required this.shippingAddressEntity,
    required this.paymentCardEntity,
    required this.status,
    required this.date,
    required this.orderProducts,
    required this.paymentMethod,
    required this.totalPrice,
    required this.uID,
  });
}
