import 'package:ecommerce_app_dashboard/core/utils/app_styles.dart';
import 'package:ecommerce_app_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:ecommerce_app_dashboard/features/auth/presentation/views/widgets/password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/colors_data.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../manager/sign_in_cubit/sign_in_cubit.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String emailAddress;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPrimaryScreenPadding,
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: 24),
              CustomTextFormField(
                hintText: "البريد الإلكتروني",
                textInputType: TextInputType.emailAddress,
                onSaved: (value) {
                  emailAddress = value!;
                },
              ),
              SizedBox(height: 16),
              PasswordField(
                onSaved: (value) {
                  password = value!;
                },
              ),
              SizedBox(height: 16),
              Text(
                'نسيت كلمة المرور؟',
                style: AppStyles.semiBold13.copyWith(
                  color: const Color(0xFF2D9F5D),
                ),
              ),
              SizedBox(height: 20),
              CustomButton(
                text: "تسجيل دخول",
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context.read<SignInCubit>().signInWithEmailAndPassword(
                      emailAddress: emailAddress,
                      password: password,
                    );
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
                backgroundColor: ColorsData.kLightPrimaryColor,
              ),
              SizedBox(height: 37),
              SizedBox(
                width: double.infinity,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text:
                            'يجب ان يكون لديك حساب مسؤول من قبل ادارة البرنامج اذا كنت ترغب في تسجيل حساب مسؤول ؟  ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w600,
                          height: 2.46,
                        ),
                      ),
                      TextSpan(
                        text: 'تواصل معنا',
                        style: TextStyle(
                          color: const Color(0xFF1B5E37),
                          fontSize: 13,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w600,
                          height: 2.46,
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
      ),
    );
  }
}
