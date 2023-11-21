import 'package:assignment_project/features/auth/presentation/pages/log_in_page.dart';
import 'package:assignment_project/features/auth/presentation/pages/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/colors_manager.dart';
import '../../../../core/font_style_manager.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_button.dart';
import '../widgets/get_start/all_social_buttons.dart';

class GetStart extends StatelessWidget {
  const GetStart({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: _buildBody(context),
        backgroundColor: ColorsManager.white,
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: ColorsManager.white,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_rounded,
          color: ColorsManager.black,
        ),
      ),
    );
  }

  Widget _buildBody(context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            AppStrings.letsGetStarted,
            style: FontManager.interSemiBold28.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 25,
            ),
          ),
          const SizedBox(
            height: 180,
          ),
          const AllSocialButtons(),
          const SizedBox(
            height: 200,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(AppStrings.alreadyHaveAccount),
              TextButton(
                onPressed: () {
                  Get.to(() => const LoginPage());
                },
                style: TextButton.styleFrom(
                    padding: EdgeInsets.zero, alignment: Alignment.centerLeft),
                child: Text(
                  AppStrings.logIn,
                  style: TextStyle(
                    color: ColorsManager.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          CustomButton(
            onPressed: () {
              Get.to(() => const SignUpPage());
            },
            buttonText: AppStrings.createAccount,
            height: 67,
            width: 364,
          ),
        ],
      ),
    );
  }
}
