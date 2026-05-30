import 'dart:io';

import 'package:ecommerce_app_dashboard/core/helper/show_false_snack_bar.dart';
import 'package:ecommerce_app_dashboard/core/utils/app_styles.dart';
import 'package:ecommerce_app_dashboard/core/utils/colors_data.dart';
import 'package:ecommerce_app_dashboard/core/widgets/custom_button.dart';
import 'package:ecommerce_app_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:ecommerce_app_dashboard/features/products_management/presentation/views/widgets/add_image_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/product_entity.dart';
import '../../manager/cubits/create_product_cubit/add_product_cubit.dart';
import 'is_featured_field.dart';
import 'is_organic_field.dart';

class AddNewProductViewBody extends StatefulWidget {
  const AddNewProductViewBody({super.key});

  @override
  State<AddNewProductViewBody> createState() => _AddNewProductViewBodyState();
}

class _AddNewProductViewBodyState extends State<AddNewProductViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<AddImageSectionState> imageKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  late String productName, productCode, productDescription;
  late num productPrice;
  File? fileImage;
  bool isFeatured = false;
  bool isOrganic = false;
  late int expirationsMonth, numberOfCalories, unitAmount;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        autovalidateMode: autoValidateMode,
        child: Column(
          children: [
            CustomTextFormField(
              onSaved: (value) {
                productName = value!;
              },
              hintText: "اسم الصنف",
              textInputType: TextInputType.text,
            ),
            SizedBox(height: 8),
            CustomTextFormField(
              onSaved: (value) {
                productPrice = num.parse(value!);
              },
              hintText: "سعر الصنف",
              textInputType: TextInputType.number,
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                    onSaved: (value) {
                      productCode = value!.toLowerCase();
                    },
                    hintText: "رمز الصنف",
                    textInputType: TextInputType.text,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CustomTextFormField(
                    onSaved: (value) {
                      expirationsMonth = int.parse(value!);
                    },
                    hintText: "مدة الصلاحية بالأشهر",
                    textInputType: TextInputType.number,
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
                      unitAmount = int.parse(value!);
                    },
                    hintText: "الكمية للسعرات (غرام)",
                    textInputType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CustomTextFormField(
                    onSaved: (value) {
                      numberOfCalories = int.parse(value!);
                    },
                    hintText: "عدد السعرات الحرارية",
                    textInputType: TextInputType.number,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            CustomTextFormField(
              onSaved: (value) {
                productDescription = value!;
              },
              textInputType: TextInputType.text,
              hintText: "تفاصيل عنه",
              maxLines: 5,
              hintPadding: const EdgeInsets.only(top: 32, right: 20),
            ),
            SizedBox(height: 16),
            IsFeaturedField(
              isChecked: isFeatured,
              onChanged: (value) {
                setState(() {
                  isFeatured = value;
                });
              },
            ),
            SizedBox(height: 16),
            IsOrganicField(
              isChecked: isOrganic,
              onChanged: (value) {
                setState(() {
                  isOrganic = value;
                });
              },
            ),
            SizedBox(height: 16),
            AddImageSection(
              key: imageKey,
              onFileChanged: (image) {
                fileImage = image;
              },
            ),
            SizedBox(height: 16),
            CustomButton(
              onPressed: () {
                if (fileImage != null) {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    ProductEntity addProductInputEntity = ProductEntity(
                      reviews: [],
                      productName: productName,
                      productCode: productCode,
                      productDescription: productDescription,
                      productPrice: productPrice,
                      fileImage: fileImage!,
                      isFeatured: isFeatured,
                      isOrganic: isOrganic,
                      unitAmount: unitAmount,
                      numberOfCalories: numberOfCalories,
                      expirationsMonth: expirationsMonth,
                    );
                    context.read<AddProductCubit>().addProduct(
                      addProductInputEntity,
                    );
                  } else {
                    autoValidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                } else {
                  showFalseSnackBar(context, errorMessage: "قم بإضافة صورة");
                }
              },
              text: "حفظ البيانات",
              textStyle: AppStyles.bold13.copyWith(color: Colors.white),
            ),
            SizedBox(height: 8),
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
          ],
        ),
      ),
    );
  }

  void resetForm() {
    _formKey.currentState?.reset();

    setState(() {
      fileImage = null;
      isFeatured = false;
      isOrganic = false;
      autoValidateMode = AutovalidateMode.disabled;
    });
  }
}
