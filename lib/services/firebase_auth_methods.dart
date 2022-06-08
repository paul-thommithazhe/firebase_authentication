import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_second/utils/showOTPDialog.dart';
import 'package:firebase_second/utils/showSnackBar.dart';
import 'package:flutter/material.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth;
  FirebaseAuthMethods(this._auth);

  //Email Sign up method using firebase

  Future<void> signUpWithEmail(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await sendEmailVerification(context);
    } on FirebaseException catch (e) {
      // if(e.code == 'weak-password'){
      //   showSnackBar(context,'You gave a weak password');
      // }
      showSnackBar(context, e.message!);
    }
  }

  //Login with Email

  Future<void> loginWithEmail(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      if (!_auth.currentUser!.emailVerified) {
        await sendEmailVerification(context);
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }
  //Email Verification

  Future<void> sendEmailVerification(BuildContext context) async {
    try {
      _auth.currentUser!.sendEmailVerification();
      showSnackBar(context, 'Email Verification Sent');
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  //phone signin

  Future<void> phoneSignin({
    required BuildContext context,
    required String phoneNumber,
  }) async {
    TextEditingController codeContoller = TextEditingController();
    //for android 
    await _auth.verifyPhoneNumber(phoneNumber: phoneNumber, verificationCompleted: (PhoneAuthCredential credential)async{
      await _auth.signInWithCredential(credential);

    }, verificationFailed: (e){
      showSnackBar(context, e.message!);
    }, codeSent: (String verificationId, int? resendToken)async{
      showOTPDialog(
        context: context,
        codeController: codeContoller,
        onPressed: ()async{
          PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: codeContoller.text.trim());
          await _auth.signInWithCredential(credential);
          Navigator.of(context).pop();
        }
        
      );

    }, codeAutoRetrievalTimeout: (String verificationId){
      //Auto-resolution timed out .... 
    });
  }
}
