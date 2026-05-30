import 'package:ecommerce_app_dashboard/core/enums/order_status_enum.dart';
import 'package:ecommerce_app_dashboard/features/orders/data/models/payment_card_model.dart';
import 'package:ecommerce_app_dashboard/features/orders/data/models/product_order_model.dart';
import 'package:ecommerce_app_dashboard/features/orders/data/models/shipping_address_model.dart';
import 'package:ecommerce_app_dashboard/features/orders/domain/entities/order_entity.dart';

class OrderModel {
  final String orderID;
  final double totalPrice;
  final String uID;
  final ShippingAddressModel shippingAddressModel;
  final List<OrderProductsModel> orderProducts;
  final PaymentCardModel paymentCardModel;
  final String paymentMethod;
  final String status;
  final String date;

  OrderModel({
    required this.orderID,
    required this.status,
    required this.date,
    required this.paymentCardModel,
    required this.orderProducts,
    required this.paymentMethod,
    required this.totalPrice,
    required this.uID,
    required this.shippingAddressModel,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      orderID: json["orderID"],
      totalPrice: (json["totalPrice"] as num).toDouble(),
      uID: json["uID"],
      shippingAddressModel: ShippingAddressModel.fromJson(
        json["shippingAddressModel"] ?? {},
      ),
      orderProducts: List<OrderProductsModel>.from(
        (json["orderProducts"] ?? []).map(
          (e) => OrderProductsModel.fromJson(e),
        ),
      ),
      paymentCardModel: PaymentCardModel.fromJson(
        json["paymentCardModel"] ?? {},
      ),
      paymentMethod: json["paymentMethod"] ?? "",
      status: json["status"] ?? "pending",
      date: json["date"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "orderID": orderID,
      "totalPrice": totalPrice,
      "uID": uID,
      "status": status,
      "date": date,
      "shippingAddressModel": shippingAddressModel.toJson(),
      "orderProducts": orderProducts.map((e) => e.toJson()).toList(),
      "paymentCardModel": paymentCardModel.toJson(),
      "paymentMethod": paymentMethod,
    };
  }

  OrderEntity toEntity() {
    return OrderEntity(
      orderID: orderID,
      totalPrice: totalPrice,
      uID: uID,
      shippingAddressEntity: shippingAddressModel.toEntity(),
      orderProducts: orderProducts.map((e) => e.toEntity()).toList(),
      paymentCardEntity: paymentCardModel.toEntity(),
      paymentMethod: paymentMethod,
      status: OrderStatusEnum.values.firstWhere(
        (e) => e.name == status,
        orElse: () => OrderStatusEnum.pending,
      ),
      date: date,
    );
  }
}
