import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/widgets.dart';

class UserService {
  final db = FirebaseDatabase.instance;
  int serverTime = 0;

  Future<bool> checkUser() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    log(uid);

    try {
      DataSnapshot user = await FirebaseDatabase.instance
          .ref('bda')
          .child('bda_auth')
          .child(uid)
          .get();

      if (user.value != null && user.child('role').value == 'bda') {
        log('User is a bda');
        return true;
      }

      DataSnapshot userIm = await FirebaseDatabase.instance
          .ref('bda')
          .child('bda_auth')
          .child(uid)
          .get();

      if (userIm.value != null && userIm.child('role').value == 'im') {
        log('User is an im');
        return true;
      }
    } catch (e) {
      log(e.toString());
    }

    log('User not found or unauthorized role');
    return false;
  }

  // UserData
  getUserData(String uId) async {
    final snapshot =
        await FirebaseDatabase.instance.ref('users').child(uId).get();
    dynamic json = snapshot.value;
    return json;
  }
}
