import 'package:ecommerce_app_dashboard/core/helper/show_false_snack_bar.dart';
import 'package:ecommerce_app_dashboard/core/helper/show_true_snack_bar.dart';
import 'package:ecommerce_app_dashboard/core/widgets/custom_loading_indicator.dart';
import 'package:ecommerce_app_dashboard/features/auth/presentation/views/widgets/login_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../dashboard/presentation/views/dashboard_view.dart';
import '../../manager/sign_in_cubit/sign_in_cubit.dart';

class LoginViewBodyBlocConsumer extends StatelessWidget {
  const LoginViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      builder: (context, state) {
        return ModalProgressHUD(
          progressIndicator: CustomLoadingIndicator(),
          inAsyncCall: state is SignInLoading,
          child: LoginViewBody(),
        );
      },
      listener: (context, state) {
        if (state is SignInFailure) {
          showFalseSnackBar(
            context,
            errorMessage: state.errMessage,
            secondsDuration: 3,
          );
        }
        if (state is SignInSuccess) {
          showTrueSnackBar(
            context,
            message: "لقد قمت بتسجيل الدخول",
            secondsDuration: 3,
          );
          Navigator.pushNamed(context, DashboardView.routeName);
        }
      },
    );
  }
}
