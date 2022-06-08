import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_second/firebase_options.dart';
import 'package:firebase_second/screens/login_email_password_signin.dart';
import 'package:firebase_second/screens/login_screen.dart';
import 'package:firebase_second/screens/phone_screen.dart';
import 'package:firebase_second/screens/signup_email_password_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Firebase Auth Demo',
      theme: ThemeData(primaryColor: Colors.blue),
      home: const LoginScreen(),
      routes: {
        EmailPasswordLogin.routeName: (context) => const EmailPasswordLogin(),
        EmailPasswordSignup.routeName: (context) => EmailPasswordSignup(),
        PhoneScreen.routeName: (context) => PhoneScreen(),
        // 'Email/PasswordLogin': (context) => const EmailPasswordLogin(),
        // 'PhoneScreen': (context) => const PhoneScreen(),
      },
    );
  }
}
