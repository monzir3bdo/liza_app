import 'package:flutter/material.dart';

import '../../../../core/font_style_manager.dart';
import '../../../../core/utils/app_strings.dart';
import '../widgets/custom_bottom_text.dart';
import '../widgets/get_start/custom_login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 105,
          ),
        ),
        SliverToBoxAdapter(
          child: Align(
            child: Text(
              AppStrings.welcome,
              style: FontManager.interSemiBold28,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Align(
            child: Text(
              AppStrings.enterYourData,
              style: FontManager.interRegular13.copyWith(
                fontWeight: FontWeight.w200,
                fontSize: 15,
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: CustomLoginForm(),
        ),
        const SliverToBoxAdapter(
          child: CustomBottomText(
            text: AppStrings.dontHaveAccount,
            textButtonName: 'Sign Up',
            destination: 'signup',
          ),
        )
      ],
    );
  }
}
