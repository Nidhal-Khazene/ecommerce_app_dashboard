import 'dart:io';

import 'package:ecommerce_app_dashboard/core/utils/app_styles.dart';
import 'package:ecommerce_app_dashboard/core/utils/colors_data.dart';
import 'package:ecommerce_app_dashboard/core/widgets/custom_button.dart';
import 'package:ecommerce_app_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:ecommerce_app_dashboard/features/products_management/domain/entities/product_entity.dart';
import 'package:ecommerce_app_dashboard/features/products_management/presentation/views/widgets/edit_image_section.dart';
import 'package:ecommerce_app_dashboard/features/products_management/presentation/views/widgets/remove_product_button_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/cubits/update_product_cubit/update_product_cubit.dart';
import 'is_featured_field.dart';
import 'is_organic_field.dart';

class EditProductInformationViewBody extends StatefulWidget {
  const EditProductInformationViewBody({
    super.key,
    required this.productEntity,
  });

  final ProductEntity productEntity;

  @override
  State<EditProductInformationViewBody> createState() =>
      _EditProductInformationViewBodyState();
}

class _EditProductInformationViewBodyState
    extends State<EditProductInformationViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<EditImageSectionState> imageKey = GlobalKey();
  String? productName, productCode, productDescription;
  num? productPrice;
  File? fileImage;
  bool? isFeatured;
  bool? isOrganic;
  int? expirationsMonth, numberOfCalories, unitAmount;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextFormField(
              onSaved: (value) {
                productName = value;
              },
              textInputType: TextInputType.text,
              hintText: widget.productEntity.productName,
              initialValue: widget.productEntity.productName,
            ),
            SizedBox(height: 8),
            CustomTextFormField(
              onSaved: (value) {
                productPrice =
                    num.tryParse(value ?? '') ??
                    widget.productEntity.productPrice;
              },
              textInputType: TextInputType.number,
              hintText: "السعر: ${widget.productEntity.productPrice} دينار ",
              initialValue: widget.productEntity.productPrice.toString(),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                    onSaved: (value) {
                      productCode = value;
                    },
                    textInputType: TextInputType.text,
                    hintText: widget.productEntity.productCode,
                    initialValue: widget.productEntity.productCode,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CustomTextFormField(
                    onSaved: (value) {
                      expirationsMonth =
                          int.tryParse(value ?? '') ??
                          widget.productEntity.expirationsMonth;
                    },
                    textInputType: TextInputType.number,
                    hintText: widget.productEntity.expirationsMonth.toString(),
                    initialValue: widget.productEntity.expirationsMonth
                        .toString(),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                    onSaved: (value) {
                      unitAmount =
                          int.tryParse(value ?? '') ??
                          widget.productEntity.unitAmount;
                    },
                    textInputType: TextInputType.number,
                    hintText: widget.productEntity.unitAmount.toString(),
                    initialValue: widget.productEntity.unitAmount.toString(),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CustomTextFormField(
                    onSaved: (value) {
                      numberOfCalories =
                          int.tryParse(value ?? '') ??
                          widget.productEntity.numberOfCalories;
                    },
                    textInputType: TextInputType.number,
                    hintText: widget.productEntity.numberOfCalories.toString(),
                    initialValue: widget.productEntity.numberOfCalories
                        .toString(),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            CustomTextFormField(
              onSaved: (value) {
                productDescription = value;
              },
              textInputType: TextInputType.text,
              hintText: widget.productEntity.productDescription,
              initialValue: widget.productEntity.productDescription,
              maxLines: 5,
              hintPadding: const EdgeInsets.only(top: 32, right: 20),
            ),
            SizedBox(height: 16),
            IsFeaturedField(
              isChecked: isFeatured ?? widget.productEntity.isFeatured,
              onChanged: (value) {
                setState(() {
                  isFeatured = value;
                });
              },
            ),
            SizedBox(height: 8),
            IsOrganicField(
              isChecked: isOrganic ?? widget.productEntity.isOrganic,
              onChanged: (value) {
                setState(() {
                  isOrganic = value;
                });
              },
            ),
            SizedBox(height: 8),
            EditImageSection(
              key: imageKey,
              productEntity: widget.productEntity,
              onFileChanged: (image) {
                fileImage = image;
              },
            ),
            SizedBox(height: 16),
            CustomButton(
              text: "تحديث البيانات",
              onPressed: () {
                _formKey.currentState!.save();
                ProductEntity addProductInputEntity = ProductEntity(
                  ratingCount: 0,
                  avrRating: 0,
                  reviews: [],
                  productName: productName ?? widget.productEntity.productName,
                  productCode: productCode ?? widget.productEntity.productCode,
                  productDescription:
                      productDescription ??
                      widget.productEntity.productDescription,
                  productPrice:
                      productPrice ?? widget.productEntity.productPrice,
                  fileImage: fileImage ?? widget.productEntity.fileImage,
                  isFeatured: isFeatured ?? widget.productEntity.isFeatured,
                  isOrganic: isOrganic ?? widget.productEntity.isOrganic,
                  unitAmount: unitAmount ?? widget.productEntity.unitAmount,
                  numberOfCalories:
                      numberOfCalories ?? widget.productEntity.numberOfCalories,
                  expirationsMonth:
                      expirationsMonth ?? widget.productEntity.expirationsMonth,
                  imagePath: widget.productEntity.imagePath,
                  urlImage: widget.productEntity.urlImage,
                );
                context.read<UpdateProductCubit>().updateProduct(
                  product: addProductInputEntity,
                  fileImage: addProductInputEntity.fileImage,
                  imagePath: widget.productEntity.imagePath,
                );
              },
              textStyle: AppStyles.bold13.copyWith(color: Colors.white),
            ),
            SizedBox(height: 16),
            CustomButton(
              text: "لا ارغب",
              onPressed: () {
                resetForm();
                imageKey.currentState?.clearImage();
              },
              borderColor: ColorsData.kPrimaryColor,
              backgroundColor: Colors.transparent,
              textStyle: AppStyles.bold13.copyWith(
                color: ColorsData.kPrimaryColor,
              ),
            ),
            SizedBox(height: 16),
            RemoveProductButtonBlocConsumer(widget: widget),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  void resetForm() {
    _formKey.currentState?.reset();

    setState(() {
      fileImage = null;
      isFeatured = widget.productEntity.isFeatured;
      isOrganic = widget.productEntity.isOrganic;
      productCode = widget.productEntity.productCode;
      productDescription = widget.productEntity.productDescription;
      productPrice = widget.productEntity.productPrice;
      productName = widget.productEntity.productName;
    });
  }
}
