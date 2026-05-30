import 'package:ecommerce_app_dashboard/features/products_management/presentation/views/widgets/edit_product_information_view.dart';
import 'package:ecommerce_app_dashboard/features/products_management/presentation/views/widgets/remove_product_Icon_bloc_consumer.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/utils/colors_data.dart';
import '../../../../../core/widgets/custom_image_network.dart';
import '../../../domain/entities/product_entity.dart';

class FruitItem extends StatefulWidget {
  const FruitItem({super.key, required this.productEntity});

  final ProductEntity productEntity;

  @override
  State<FruitItem> createState() => _FruitItemState();
}

class _FruitItemState extends State<FruitItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: const Color(0xFFF3F5F7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                const SizedBox(height: 17),
                widget.productEntity.urlImage != null
                    ? Flexible(
                        child: GestureDetector(
                          onTap: () async {
                            await Navigator.pushNamed(
                              context,
                              EditProductInformationView.routeName,
                              arguments: widget.productEntity,
                            );
                          },
                          child: CustomImageNetwork(
                            urlImage: "${widget.productEntity.urlImage!}}",
                          ),
                        ),
                      )
                    : Flexible(
                        child: Container(
                          color: Colors.grey,
                          height: 105,
                          width: 114,
                        ),
                      ),
                const SizedBox(height: 24),
                ListTile(
                  title: Text(
                    widget.productEntity.productName,
                    style: AppStyles.semiBold13,
                  ),
                  subtitle: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '${widget.productEntity.productPrice}دينار ',
                          style: AppStyles.bold13.copyWith(
                            color: ColorsData.kSecondaryColor,
                          ),
                        ),
                        TextSpan(
                          text: '/ الكيلو',
                          style: AppStyles.semiBold13.copyWith(
                            color: ColorsData.kLightSecondaryColor,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 30,
            left: 0,
            child: RemoveProductIconBlocConsumer(widget: widget),
          ),
        ],
      ),
    );
  }
}
