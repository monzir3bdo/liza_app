import 'package:assignment_project/features/auth/presentation/controller/auth_controller.dart';
import 'package:assignment_project/features/auth/presentation/pages/forget_password_page.dart';

import 'package:assignment_project/features/auth/presentation/widgets/get_start/auth_form_field.dart';
import 'package:assignment_project/features/auth/presentation/widgets/get_start/remember_me_widget.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/widgets/custom_button.dart';
import 'forget_password_widget.dart';

class CustomLoginForm extends StatelessWidget {
  CustomLoginForm({super.key});
  final controller = AuthController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      builder: (_) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: controller.loginKey.value,
          child: Column(children: [
            AuthFormField(
              name: 'Email',
              onChanged: (email) {
                controller.email.value = email;
              },
            ),
            AuthFormField(
              name: 'Password',
              onChanged: (password) {
                controller.password.value = password;
              },
              obscureText: controller.isObscureText.value,
              suffixWidget: IconButton(
                onPressed: () {
                  //todo: should try it with fat arrow notation
                  controller.obscurePasswordText();
                },
                icon: controller.isObscureText.value
                    ? const Icon(Icons.visibility_rounded)
                    : const Icon(Icons.visibility_off_rounded),
              ),
            ),
            const SizedBox(
              height: 28,
            ),
            ForgetPasswordWidget(
              text: 'ForgetPassword?',
              onPressed: () {
                Get.off(() => const ForgetPasswordPage());
              },
            ),
            const RememberMeWidget(),
            const SizedBox(
              height: 140,
            ),
            CustomButton(
              onPressed: () async {
                if (controller.loginKey.value.currentState!.validate()) {
                  await controller.loginWithEmailAndPassword();
                }
              },
              height: 67,
              width: 364,
              buttonText: 'Log In',
            ),
          ]),
        ),
      ),
    );
  }
}

// listener: (context, state) {
// if (state is LoginSuccessState) {
// if (!FirebaseAuth.instance.currentUser!.emailVerified) {
// //todo: show toast or snack bar for welcome
// //todo: navigate to products page
// } else {
// //todo: show toast for verify email
// }
// } else if (state is LoginFailureState) {
// customToast(state.message);
// }
// },
