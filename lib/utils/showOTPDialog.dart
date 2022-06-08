import 'package:flutter/material.dart';

showOTPDialog({
  required BuildContext context,
  required TextEditingController codeController,
  required VoidCallback onPressed,
}) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
            title: const Text('Enter OTP'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
              TextField(
                controller: codeController,
              )
            ]),
            actions: [TextButton(onPressed: onPressed, child: Text('Done'))],
          ));
}
