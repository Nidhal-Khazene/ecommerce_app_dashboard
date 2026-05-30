import 'dart:io';

import 'package:ecommerce_app_dashboard/core/utils/app_styles.dart';
import 'package:ecommerce_app_dashboard/core/utils/colors_data.dart';
import 'package:ecommerce_app_dashboard/core/widgets/custom_button.dart';
import 'package:ecommerce_app_dashboard/core/widgets/custom_image_network.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../domain/entities/product_entity.dart';

class EditImageSection extends StatefulWidget {
  const EditImageSection({
    super.key,
    required this.productEntity,
    required this.onFileChanged,
  });

  final ProductEntity productEntity;
  final ValueChanged<File?> onFileChanged;

  @override
  State<EditImageSection> createState() => EditImageSectionState();
}

class EditImageSectionState extends State<EditImageSection> {
  bool isLoading = false;
  File? fileImage;

  void clearImage() {
    setState(() {
      fileImage = null;
    });
    widget.onFileChanged(null);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Text('رفع صورة المنتج', style: AppStyles.bold13),
              ),
              SizedBox(height: 16),
              CustomButton(
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });
                  try {
                    await pickImage();
                  } catch (e) {
                    setState(() {
                      isLoading = false;
                    });
                  }
                  setState(() {
                    isLoading = false;
                  });
                },
                backgroundColor: ColorsData.kPrimaryColor,
                text: 'اضف صورة',
                textStyle: AppStyles.bold13.copyWith(color: Colors.white),
                height: 44,
                width: 156,
              ),
            ],
          ),
        ),
        SizedBox(
          width: 130,
          height: 155,
          child: Stack(
            children: [
              Positioned(
                top: 25,
                child: fileImage != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.file(fileImage!, height: 155, width: 130),
                      )
                    : CustomImageNetwork(
                        urlImage: widget.productEntity.urlImage!,
                        width: 124,
                        height: 124,
                      ),
              ),
              // Positioned(
              //   top: 5,
              //   left: 0,
              //   child: GestureDetector(
              //     onTap: () {
              //       clearImage();
              //     },
              //     child: Icon(Iconsax.gallery_remove_copy),
              //   ),
              // ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    fileImage = File(image!.path);
    if (fileImage == null) {
      setState(() {
        isLoading = false;
      });
    }
    widget.onFileChanged(fileImage!);
  }
}
