import 'package:flutter/material.dart';

import '../../../../core/colors_manager.dart';

class CustomBottomText extends StatelessWidget {
  final String text;
  final String textButtonName;

  void Function()? onPressed;
  CustomBottomText(
      {required this.text,
      required this.textButtonName,
      required this.onPressed,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text),
        TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
              padding: EdgeInsets.zero, alignment: Alignment.centerLeft),
          child: Text(
            textButtonName,
            style: TextStyle(
              color: ColorsManager.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
