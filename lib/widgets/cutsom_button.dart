import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({Key? key, required this.buttonTitleName,required this.onTap}) : super(key: key);
  String buttonTitleName;
  VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Text(buttonTitleName),
    );
  }
}
