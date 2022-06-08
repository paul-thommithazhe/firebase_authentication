import 'package:firebase_second/screens/login_email_password_signin.dart';
import 'package:firebase_second/screens/phone_screen.dart';
import 'package:firebase_second/screens/signup_email_password_screen.dart';
import 'package:firebase_second/widgets/cutsom_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              buttonTitleName: 'Email/Password Sign in',
              onTap: () {
                Navigator.pushNamed(context, EmailPasswordLogin.routeName);
              },
            ),
            CustomButton(
              buttonTitleName: 'Email/password Sign Up',
              onTap: () {
                Navigator.pushNamed(context, EmailPasswordSignup.routeName);
              },
            ),
            CustomButton(
              buttonTitleName: 'Phone Sign In ',
              onTap: () {
                Navigator.pushNamed(context,PhoneScreen.routeName);
              },
            ),
            CustomButton(
              buttonTitleName: 'Google Sign In',
              onTap: () {
                Navigator.of(context).pushNamed('EmailPasswordSignup');
              },
            ),
            CustomButton(
              buttonTitleName: 'Facebook Sign In',
              onTap: () {
                Navigator.of(context).pushNamed('EmailPasswordSignup');
              },
            ),
            CustomButton(
              buttonTitleName: 'Anonymous Sign In',
              onTap: () {
               Navigator.pushNamed(context, EmailPasswordSignup.routeName);
              },
            )
          ],
        ),
      )),
    );
  }
}
