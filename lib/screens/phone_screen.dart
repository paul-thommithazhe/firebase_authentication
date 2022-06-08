import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_second/services/firebase_auth_methods.dart';
import 'package:flutter/material.dart';

class PhoneScreen extends StatelessWidget {
  PhoneScreen({Key? key}) : super(key: key);
  static String routeName = '/phone-otp-login';
  TextEditingController phoneController = TextEditingController();
  void phoneSignin(context) async {
    FirebaseAuthMethods(FirebaseAuth.instance).phoneSignin(
      context: context,
      phoneNumber: phoneController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 213, 204, 204),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              controller: phoneController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  fillColor: Colors.transparent),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                phoneSignin(context);
              },
              child: const Text('Send  OTP'))
        ]),
      ),
    );
  }
}
