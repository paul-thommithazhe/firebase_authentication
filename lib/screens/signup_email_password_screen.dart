import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_second/services/firebase_auth_methods.dart';
import 'package:firebase_second/widgets/custom_textField.dart';
import 'package:flutter/material.dart';

class EmailPasswordSignup extends StatefulWidget {
  EmailPasswordSignup({Key? key}) : super(key: key);
  static String routeName = '/email-password-signup';

  @override
  State<EmailPasswordSignup> createState() => _EmailPasswordSignupState();
}

class _EmailPasswordSignupState extends State<EmailPasswordSignup> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  signUpUser(context) async {
    await FirebaseAuthMethods(FirebaseAuth.instance).signUpWithEmail(
      email: emailController.text,
      password: passwordController.text,
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text('Signup',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        const SizedBox(height: 30),
        CustomTextField(
            controllerName: emailController, hintText: 'Enter your Email'),
        CustomTextField(
            controllerName: passwordController,
            hintText: 'Enter your Password'),
        ElevatedButton(
            onPressed: () {
              signUpUser(context);
            },
            child: const Text('Signup'))
      ]),
    );
  }
}
