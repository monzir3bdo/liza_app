import 'package:flutter/material.dart';

import 'social_media_button.dart';

class AllSocialButtons extends StatelessWidget {
  const AllSocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          SocialMediaButton(
            buttonName: 'Facebook',
            buttonColor: const Color(0xff4267B2),
            buttonIcon: Image.asset(
              'assets/images/facebook.png',
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SocialMediaButton(
              buttonName: 'Twitter',
              buttonColor: const Color(0xff1DA1F2),
              buttonIcon: Image.asset('assets/images/twitter.png')),
          const SizedBox(
            height: 10,
          ),
          SocialMediaButton(
            buttonName: 'Google',
            buttonColor: const Color(0xffEA4335),
            buttonIcon: Image.asset('assets/images/google.png'),
          ),
        ],
      ),
    );
  }
}
