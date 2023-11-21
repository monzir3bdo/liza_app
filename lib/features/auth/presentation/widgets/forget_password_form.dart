import 'package:assignment_project/features/auth/presentation/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/custom_button.dart';
import 'get_start/auth_form_field.dart';

class ForgetPasswordForm extends StatelessWidget {
  const ForgetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AuthController();
    return GetBuilder(
        init: controller,
        builder: (_) {
          return Form(
            key: controller.forgetKey.value,
            child: Column(
              children: [
                AuthFormField(
                  name: 'Email',
                  onChanged: (email) {
                    controller.email.value = email;
                  },
                ),
                const SizedBox(
                  height: 106,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 36.0),
                  child: Text(
                    'Please write your email to receive a confirmation code to set a new password.',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomButton(
                  onPressed: () {
                    controller.resetPassword();
                  },
                  buttonText: 'Confirm Mail',
                  height: 67,
                  width: 367,
                ),
              ],
            ),
          );
        });
  }
}

// listener: (context, state) {
// if (state is ForgetPasswordSuccessState) {
// customToast('check your email');
// customReplacmentNavigation(context, '/login');
// } else if (state is ForgetPasswordFailureState) {
// customToast(state.message);
// }
// });
