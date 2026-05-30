import 'dart:io';

import 'package:ecommerce_app_dashboard/core/utils/app_styles.dart';
import 'package:ecommerce_app_dashboard/core/utils/colors_data.dart';
import 'package:ecommerce_app_dashboard/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AddImageSection extends StatefulWidget {
  const AddImageSection({super.key, required this.onFileChanged});

  final ValueChanged<File?> onFileChanged;

  @override
  State<AddImageSection> createState() => AddImageSectionState();
}

class AddImageSectionState extends State<AddImageSection> {
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
        Stack(
          children: [
            Center(
              child: Column(
                children: [
                  fileImage != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.file(
                            fileImage!,
                            height: 155,
                            width: 130,
                          ),
                        )
                      : Padding(
                          padding: EdgeInsets.symmetric(vertical: 6),
                          child: Skeletonizer(
                            enabled: isLoading,
                            child: Icon(
                              Iconsax.gallery_export_copy,
                              size: 124,
                              color: Color(0xff292D32),
                            ),
                          ),
                        ),
                ],
              ),
            ),
            Visibility(
              visible: fileImage != null,
              child: Positioned(
                left: 4,
                top: 35,
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: ShapeDecoration(
                    shape: OvalBorder(),
                    color: ColorsData.kPrimaryColor,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        fileImage = null;
                        widget.onFileChanged(null);
                      });
                    },
                    child: Icon(
                      Icons.delete_rounded,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
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
