import 'dart:io';

import 'package:ecommerce_app_dashboard/core/utils/app_styles.dart';
import 'package:ecommerce_app_dashboard/core/utils/colors_data.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageField extends StatefulWidget {
  const ImageField({super.key, required this.onFileChanged});
  final ValueChanged<File?> onFileChanged;

  @override
  State<ImageField> createState() => _ImageFieldState();
}

class _ImageFieldState extends State<ImageField> {
  bool isLoading = false;
  File? fileImage;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorsData.kContainerFieldColor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 1, color: ColorsData.kBorderColor),
          ),
          child: Stack(
            children: [
              GestureDetector(
                onTap: () async {
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
                child: Center(
                  child: Column(
                    children: [
                      fileImage != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.file(fileImage!),
                            )
                          : Padding(
                              padding: EdgeInsets.symmetric(vertical: 6),
                              child: Skeletonizer(
                                enabled: isLoading,
                                child: Icon(
                                  Icons.image_rounded,
                                  size: 180,
                                  color: const Color(0xFFC9CECE),
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: fileImage != null,
                child: Positioned(
                  left: 8,
                  top: 8,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          fileImage = null;
                          widget.onFileChanged(null);
                        });
                      },
                      icon: Icon(
                        Icons.delete_rounded,
                        color: ColorsData.kLightPrimaryColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 12),
        Container(
          decoration: ShapeDecoration(
            color: ColorsData.kContainerFieldColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          padding: EdgeInsets.all(8),
          child: Text(
            "Product Image",
            style: AppStyles.regular16.copyWith(color: const Color(0xFF949D9E)),
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
