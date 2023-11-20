import 'package:flutter/material.dart';

import '../../../../core/colors_manager.dart';

class CustomBottomText extends StatelessWidget {
  final String text;
  final String textButtonName;
  final String destination;
  const CustomBottomText(
      {required this.text,
      required this.textButtonName,
      required this.destination,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text),
        TextButton(
          onPressed: () {
            //todo: got to custom destination
          },
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
