import 'package:flutter/material.dart';

class SocialMediaButton extends StatelessWidget {
  final String buttonName;
  final Color buttonColor;
  final Widget buttonIcon;
  const SocialMediaButton(
      {super.key,
      required this.buttonName,
      required this.buttonColor,
      required this.buttonIcon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
          backgroundColor: buttonColor,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buttonIcon,
              const SizedBox(
                width: 5,
              ),
              Text(
                buttonName,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
