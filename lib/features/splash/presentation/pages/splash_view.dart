import 'package:assignment_project/features/auth/presentation/pages/get_start_screen.dart';
import 'package:assignment_project/features/auth/presentation/pages/onboard_page.dart';
import 'package:assignment_project/features/products/presentation/pages/real_home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/database/cache_helper.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(
        const Duration(
          seconds: 2,
        ), () async {
      bool isOnboardingVisisted =
          await Get.find<CacheHelper>().getData(key: 'isOnboardingVisited') ??
              false;
      if (isOnboardingVisisted) {
        FirebaseAuth.instance.currentUser == null
            ? Get.offAll(() => const GetStart())
            : Get.offAll(() => SwitchPage());
      } else {
        Get.to(() => const OnBoardingPage());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff3D93F8),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Center(
      child: SvgPicture.asset(
        'assets/images/splash_logo.svg',
        width: 50,
        height: 50,
      ),
    );
  }
}
