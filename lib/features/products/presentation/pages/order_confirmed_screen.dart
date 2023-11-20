import 'package:assignment_project/core/widgets/custom_button.dart';
import 'package:assignment_project/features/products/presentation/pages/order_tacking_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class OrderConfirmedScreen extends StatelessWidget {
  const OrderConfirmedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }
}

Widget _buildBody() {
  return Container(
    padding: const EdgeInsets.only(top: 150, left: 69, right: 69, bottom: 50),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Center(child: SvgPicture.asset('assets/images/order_confirmed.svg')),
        const SizedBox(
          height: 50,
        ),
        const Text(
          'Congratulations!!!',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 10,
        ),
        const Expanded(
          child: Text(
            'Your order have been taken and is being attended to',
            style: TextStyle(fontSize: 15),
            softWrap: true,
            textAlign: TextAlign.center,
          ),
        ),
        CustomButton(
            onPressed: () {
              Get.to(() => const OrderTrackingPage());
            },
            buttonText: 'Track Your Order',
            height: 60,
            width: double.infinity)
      ],
    ),
  );
}
