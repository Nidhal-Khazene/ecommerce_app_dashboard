import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../core/widgets/custom_text_form_field.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key, this.onSaved});

  final void Function(String?)? onSaved;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      obscureText: obscureText,
      onSaved: widget.onSaved,
      hintText: "كلمة المرور",
      suffixIcon: GestureDetector(
        onTap: () {
          obscureText = !obscureText;
          setState(() {});
        },
        child: !obscureText
            ? Padding(
                padding: EdgeInsets.only(left: 31),
                child: Icon(Iconsax.eye),
              )
            : Padding(
                padding: EdgeInsets.only(left: 31),
                child: const Icon(Icons.visibility_off),
              ),
      ),
      textInputType: TextInputType.visiblePassword,
    );
  }
}
