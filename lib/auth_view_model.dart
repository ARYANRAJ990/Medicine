import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:medicine/auth_services.dart';

class AuthViewModel extends ChangeNotifier {
  TextEditingController emailText = TextEditingController();
  TextEditingController passwordText = TextEditingController();
  TextEditingController otpController = TextEditingController();

  login(BuildContext context) {
    AuthService().login(context, emailText.text, passwordText.text);
  }

  // sendOtp(BuildContext context) {
  //   AuthService().sendOtp(context, emailText.text);
  // }

  googleSignIn(BuildContext context) {
    AuthService().signInWithGoogle(context);
  }
}
