import 'dart:ffi';

import 'package:assignment_project/core/widgets/get_snack_bar.dart';
import 'package:assignment_project/core/widgets/loading_widget.dart';
import 'package:assignment_project/features/auth/presentation/pages/log_in_page.dart';

import 'package:assignment_project/features/products/presentation/pages/real_home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final name = ''.obs;
  final email = ''.obs;
  final password = ''.obs;
  final isObscureText = true.obs;

  final loginKey = GlobalKey<FormState>().obs;
  final signUpKey = GlobalKey<FormState>().obs;

  final forgetKey = GlobalKey<FormState>().obs;
  createUserWithEmailAndPassword() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.value,
        password: password.value,
      );
      const LoadingWidget();
      await verifyEmail();
      await userProfile();
      getSnackBar(
        message: 'Account Created Successfully...Please Verify Your account',
        color: Colors.blue,
        seconds: 2,
      );

      Get.offAll(() => const LoginPage());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        getSnackBar(
            message: 'Weak Password',
            color: Colors.red,
            icon: const Icon(
              CupertinoIcons.multiply,
              color: Colors.white,
            ));
      } else if (e.code == 'email-already-in-use') {
        getSnackBar(
          icon: const Icon(
            Icons.alternate_email_rounded,
            color: Colors.white,
          ),
          message: 'Email already in use',
          color: Colors.red,
        );
      } else {
        getSnackBar(message: 'Please Try again');
      }
    } catch (e) {
      getSnackBar(
          message: 'email-already-in-use', seconds: 2, color: Colors.red);
    }
  }

  loginWithEmailAndPassword() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.value, password: password.value);

      Get.offAll(() => SwitchPage());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.showSnackbar(
          const GetSnackBar(
            message: 'user-not-found',
            duration: Duration(seconds: 1),
          ),
        );
      } else if (e.code == 'wrong-password') {
        Get.showSnackbar(
          const GetSnackBar(
            message: 'wrong-password',
          ),
        );
      } else {
        Get.showSnackbar(
          const GetSnackBar(
            message: 'Not Registered Yet',
          ),
        );
      }
    }
  }

  void obscurePasswordText() {
    if (isObscureText.value == true) {
      isObscureText.value = false;
    } else {
      isObscureText.value = true;
    }
    update();
  }

  signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  verifyEmail() async {
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
  }

  void resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: email.value,
      );
    } catch (e) {}
  }

  userProfile() async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    await users
        .add({
          'email': email.value,
          'username': name.obs,
        })
        .then((value) => print('User Created'))
        .catchError((error) {
          print('failed to add user:$error');
        });
  }
}
