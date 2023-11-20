import 'package:flutter/material.dart';

class OrderTrackingPage extends StatelessWidget {
  const OrderTrackingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }
}

Widget _buildBody() {
  return Container(
    padding: const EdgeInsets.only(top: 30),
    child: Column(
      children: [
        Stepper(
          margin: const EdgeInsets.all(20),
          currentStep: 3,
          connectorThickness: 0.4,
          steps: const [
            Step(
              title: StepperIconWidget(
                name: 'order_taken',
                color: Color(0xFFFFFAEB),
              ),
              content: Text('Order Taken'),
            ),
            Step(
              title: StepperIconWidget(
                name: 'order_prepared',
                color: Color(0xFFF1EFF6),
              ),
              content: Text('Order_Prepared'),
            ),
            Step(
              isActive: true,
              title: StepperIconWidget(
                name: 'order_delivered',
                color: Color(0xFFFEF0F0),
              ),
              content: Text('Order is Being delievered'),
            ),
            Step(
              title: StepperIconWidget(
                  name: 'order_received', color: Color(0xFFF0FEF8)),
              content: Text('Order Received'),
            ),
          ],
        ),
      ],
    ),
  );
}

class StepperIconWidget extends StatelessWidget {
  final String name;
  final Color color;
  const StepperIconWidget({super.key, required this.name, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 20, bottom: 10),
        height: 75,
        width: 74,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Image.asset(
          'assets/images/$name.png',
        ));
  }
}
