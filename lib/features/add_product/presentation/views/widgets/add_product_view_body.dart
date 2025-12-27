import 'package:ecommerce_app_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:ecommerce_app_dashboard/core/widgets/image_field.dart';
import 'package:flutter/material.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

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
              hintText: "Product Name",
              textInputType: TextInputType.text,
            ),
            SizedBox(height: 16),
            CustomTextFormField(
              hintText: "Product Price",
              textInputType: TextInputType.number,
            ),
            SizedBox(height: 16),
            CustomTextFormField(
              hintText: "Product Code",
              textInputType: TextInputType.name,
            ),
            SizedBox(height: 16),
            CustomTextFormField(
              hintText: "Product Description",
              textInputType: TextInputType.text,
              maxLines: 5,
            ),
            SizedBox(height: 16),
            ImageField(onFileChanged: (image) {}),
          ],
        ),
      ),
    );
  }
}
