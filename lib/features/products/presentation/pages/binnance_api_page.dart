import 'package:assignment_project/features/products/presentation/controller/socket_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BinnancePage extends StatelessWidget {
  const BinnancePage({super.key});

  @override
  Widget build(BuildContext context) {
    final SocketController controller = Get.put(SocketController());

    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
              child: Text(
            'BTC equals today',
            style: TextStyle(fontSize: 20, color: Colors.white),
          )),
          Obx(
            () => Text(
              '${controller.data}\$',
              style: const TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
        ],
      ),
    );
  }
}
