import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../service/firebase_auth_service.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();

  final passwordController = TextEditingController();
  var isChecked = false.obs;

  void checkIfUserIsLoggedIn(BuildContext context) async {
    final user = await FirebaseAuthService().getLoggedInUser();
    if (user != null) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('uId', user.uid);
      Navigator.of(context).pushNamed('/mainApp');
    }
  }

  ///Function to handel login onPressed
  handleLogin(BuildContext context) async {
    if (isChecked.value != null) {
      if (isChecked.value) {
        final username = usernameController.text;
        final password = passwordController.text;
        final firebaseAuthService = FirebaseAuthService();
        final User? user = await firebaseAuthService.loginWithEmailAndPassword(
            username, password);
        if (user != null) {
          print('login successful');
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('uId', user.uid);
          Navigator.of(context).pushReplacementNamed('/mainApp');
        } else {
          print('login error');
        }
//proceed
      } else {
        print('Please check the terms');
      }
    }
  }
}
