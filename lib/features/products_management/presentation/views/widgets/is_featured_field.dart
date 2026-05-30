import 'package:ecommerce_app_dashboard/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/widgets/custom_check_box.dart';

class IsFeaturedField extends StatelessWidget {
  const IsFeaturedField({
    super.key,
    required this.onChanged,
    required this.isChecked,
  });

  final ValueChanged<bool> onChanged;
  final bool isChecked;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(isChecked: isChecked, onChecked: onChanged),
        const SizedBox(width: kSizedBoxHeight16),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "هل المنتج معروض؟",
                  style: AppStyles.semiBold13.copyWith(
                    color: const Color(0xFF949D9E),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
