import 'package:flutter/material.dart';

import 'custom_cupertion_switch.dart';

class RememberMeWidget extends StatelessWidget {
  const RememberMeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text('Remember Me'),
        SizedBox(
          width: 210,
        ),
        CustomCupertinoSwitch(),
      ],
    );
  }
}
