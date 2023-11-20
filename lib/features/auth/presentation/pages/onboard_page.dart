import 'package:assignment_project/features/auth/presentation/pages/get_start_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/colors_manager.dart';
import '../../../../core/database/cache_helper.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_button.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  _buildBody(context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/onboarding_man.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 31),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              AppStrings.welcomeToTheStore,
              style: TextStyle(
                color: ColorsManager.white,
                fontSize: 48,
                fontWeight: FontWeight.w500,
                fontFamily: 'Abel-Regular',
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
            const SizedBox(
              height: 19,
            ),
            Text(
              AppStrings.getWhatYouWant,
              style: TextStyle(
                color: ColorsManager.white,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 41,
            ),
            CustomButton(
                onPressed: () {
                  // CacheHelper()
                  //     .saveData(key: 'isOnboardingVisited', value: true);
                  Get.find<CacheHelper>()
                      .saveData(key: 'isOnboardingVisited', value: true);
                  print("Value Saved Successfully");
                  Get.to(() => const GetStart());
                },
                buttonText: "Get Started",
                height: 67,
                width: 350),
            const SizedBox(
              height: 87,
            )
          ],
        ),
      ),
    );
  }
}
