import 'package:flutter/material.dart';

import '../../../../core/utils/app_strings.dart';
import '../widgets/forget_password_form.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _buildBody(),
      ),
    );
  }

  _buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 45,
            ),
          ),
          const SliverToBoxAdapter(
            child: Text(
              AppStrings.forgetPassword,
              style: TextStyle(
                fontSize: 25,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 48,
            ),
          ),
          SliverToBoxAdapter(
            child: Image.asset('assets/images/forget_password.png'),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          const SliverToBoxAdapter(
            child: ForgetPasswordForm(),
          ),
        ],
      ),
    );
  }
}
