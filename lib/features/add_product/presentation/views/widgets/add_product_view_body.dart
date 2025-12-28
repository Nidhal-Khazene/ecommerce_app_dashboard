import 'dart:io';

import 'package:ecommerce_app_dashboard/core/helper/show_snack_bar.dart';
import 'package:ecommerce_app_dashboard/core/widgets/custom_button.dart';
import 'package:ecommerce_app_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:ecommerce_app_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';
import 'package:ecommerce_app_dashboard/features/add_product/presentation/views/widgets/image_field.dart';
import 'package:ecommerce_app_dashboard/features/add_product/presentation/views/widgets/is_featured_field.dart';
import 'package:flutter/material.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  late String productName, productCode, productDescription;
  late num productPrice;
  File? fileImage;
  bool isFeatured = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        autovalidateMode: autoValidateMode,
        child: Column(
          children: [
            SizedBox(height: 16),
            CustomTextFormField(
              onSaved: (value) {
                productName = value!;
              },
              hintText: "Product Name",
              textInputType: TextInputType.text,
            ),
            SizedBox(height: 16),
            CustomTextFormField(
              onSaved: (value) {
                productPrice = num.parse(value!);
              },
              hintText: "Product Price",
              textInputType: TextInputType.number,
            ),
            SizedBox(height: 16),
            CustomTextFormField(
              onSaved: (value) {
                productCode = value!.toLowerCase();
              },
              hintText: "Product Code",
              textInputType: TextInputType.name,
            ),
            SizedBox(height: 16),
            CustomTextFormField(
              onSaved: (value) {
                productDescription = value!;
              },
              hintText: "Product Description",
              textInputType: TextInputType.text,
              maxLines: 5,
            ),
            SizedBox(height: 16),
            IsFeaturedField(
              onChanged: (value) {
                isFeatured = value;
              },
            ),
            SizedBox(height: 16),
            ImageField(
              onFileChanged: (image) {
                fileImage = image;
              },
            ),
            SizedBox(height: 24),
            CustomButton(
              onPressed: () {
                if (fileImage != null) {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    AddProductInputEntity input = AddProductInputEntity(
                      productName: productName,
                      productCode: productCode,
                      productDescription: productDescription,
                      productPrice: productPrice,
                      fileImage: fileImage!,
                      isFeatured: isFeatured,
                    );
                  } else {
                    autoValidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                } else {
                  showSnackBar(context, "add an image!");
                }
              },
              text: "add product",
              textStyle: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
