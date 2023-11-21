import 'package:assignment_project/features/auth/presentation/controller/auth_controller.dart';
import 'package:assignment_project/features/auth/presentation/widgets/get_start/remember_me_widget.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../core/widgets/custom_button.dart';

import 'auth_form_field.dart';

class CustomSignUpForm extends StatelessWidget {
  const CustomSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AuthController();

    return GetBuilder(
      init: controller,
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: controller.signUpKey.value,
            child: Column(
              children: [
                AuthFormField(
                  name: 'UserName',
                  onChanged: (username) {
                    controller.name.value = username;
                  },
                ),
                AuthFormField(
                  suffixWidget: IconButton(
                    onPressed: () {
                      controller.obscurePasswordText();
                    },
                    icon: controller.isObscureText.value
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                  ),
                  obscureText: controller.isObscureText.value,
                  name: 'Password',
                  onChanged: (password) {
                    controller.password.value = password;
                  },
                ),
                AuthFormField(
                  name: 'Email Address',
                  onChanged: (email) {
                    controller.email.value = email;
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                const RememberMeWidget(),
                const SizedBox(
                  height: 100,
                ),
                CustomButton(
                  onPressed: () async {
                    if (controller.signUpKey.value.currentState!.validate()) {
                      await controller.createUserWithEmailAndPassword();
                    }
                  },
                  height: 67,
                  width: 364,
                  buttonText: 'Sign Up',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
// if (state is AuthSuccessState) {
// FirebaseAuth.instance.currentUser!.emailVerified
// ? customToast('Account created..Please Verify your email')
//     : customReplacmentNavigation(context, '/login');
// }
//
// if (state is AuthLoadingState) {
// const LoadingWidget();
// } else if (state is AuthFailureState) {
// customToast(state.message);
// }
// },
