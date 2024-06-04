import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:medicine/constant.dart';
import 'package:medicine/feed.dart';
import 'package:medicine/snackbar.dart';
import 'package:medicine/string.dart';
import 'package:medicine/user_service.dart';

import 'package:uiblock/uiblock.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  login(BuildContext context, String email, String password) async {
    print('object');
    UIBlock.block(
      context,
      childBuilder: (context) =>
          const Center(child: CircularProgressIndicator()),
    );

    try {
      log('got to try');
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        log('after try go to sign in');
        print(value.user!.uid);
        // await UserService().checkUser().then((value) {
        //   UIBlock.unblock(context);
        //   if (value) {
        // Constants.prefs.setBool(AppStrings.isLoggedIn, true);
        log('after check user');
        PageNavigator(ctx: context).nextPageOnly(page: const Add());
        // } else {
        //   showSnackBar(context: context, message: 'User not registered');
        // }
      });
      // }
    } catch (e) {
      UIBlock.unblock(context);
      showSnackBar(context: context, message: 'Enter valid email address');
      log(e.toString());
    }
  }

  // sendOtp(BuildContext context, String phone) async {
  //   UIBlock.block(
  //     context,
  //     childBuilder: (context) =>
  //         const Center(child: CircularProgressIndicator()),
  //   );

  //   await _auth.verifyPhoneNumber(
  //     phoneNumber: '+91 $phone',
  //     verificationCompleted: (PhoneAuthCredential credential) async {
  //       await _auth.signInWithCredential(credential);
  //       UIBlock.unblock(context);
  //     },
  //     verificationFailed: (FirebaseAuthException e) {
  //       UIBlock.unblock(context);
  //     },
  //     codeSent: (String verificationId, int? resendToken) {
  //       UIBlock.unblock(context);
  //       showSnackBar(
  //           context: context,
  //           message: "An Otp code has been sent to your phone number");
  //       PageNavigator(ctx: context)
  //           .nextPage(page: OtpScreen(verificationId: verificationId));
  //     },
  //     codeAutoRetrievalTimeout: (String verificationId) {},
  //   );
  // }

  signInWithGoogle(BuildContext context) async {
    UIBlock.block(context);
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    UserCredential user =
        await FirebaseAuth.instance.signInWithCredential(credential);
    UIBlock.unblock(context);

    if (user.user != null) {
      Constants.prefs.setBool(AppStrings.isLoggedIn, true);
      PageNavigator(ctx: context).nextPage(page: const Add());
    }
  }
}

class PageNavigator {
  PageNavigator({this.ctx});

  BuildContext? ctx;

  Future nextPage({Widget? page}) {
    return Navigator.push(
        ctx!, CupertinoPageRoute(builder: ((context) => page!)));
  }

  nextPageOnly({Widget? page}) {
    return Navigator.pushAndRemoveUntil(
        ctx!, MaterialPageRoute(builder: (context) => page!), (route) => false);
  }
}
