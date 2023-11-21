import 'package:assignment_project/features/auth/presentation/controller/auth_controller.dart';
import 'package:flutter/material.dart';

class ForgetPasswordWidget extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  const ForgetPasswordWidget(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 22.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: TextButton(
            onPressed: onPressed,
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.red,
              ),
            )),
      ),
    );
  }
}
