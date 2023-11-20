import 'package:flutter/cupertino.dart';

class CustomCupertinoSwitch extends StatefulWidget {
  const CustomCupertinoSwitch({super.key});

  @override
  State<CustomCupertinoSwitch> createState() => _CustomCupertinoSwitchState();
}

class _CustomCupertinoSwitchState extends State<CustomCupertinoSwitch> {
  bool startingValue = true;
  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
        value: startingValue,
        onChanged: (value) {
          setState(() {
            startingValue = value;
          });
        });
  }
}
