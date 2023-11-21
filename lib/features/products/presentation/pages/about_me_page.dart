import 'package:assignment_project/features/auth/presentation/controller/auth_controller.dart';
import 'package:assignment_project/features/auth/presentation/pages/get_start_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutMePage extends StatelessWidget {
  const AboutMePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(
            child: Text(
          'Developed by Monzir ',
          style: TextStyle(
            fontSize: 30,
          ),
        )),
        ElevatedButton(
            onPressed: () {
              var controller = Get.put(AuthController());
              controller.signOut();
              Get.offAll(const GetStart());
            },
            child: const Text('Log Out')),
      ],
    ));
  }
}
