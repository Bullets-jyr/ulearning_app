import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/global_loader/global_loader.dart';
import 'package:ulearning_app/common/models/user.dart';
import 'package:ulearning_app/common/services/http_util.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/common/widgets/popup_messages.dart';
import 'package:ulearning_app/features/sign_in/provider/sign_in_notifier.dart';
import 'package:ulearning_app/features/sign_in/repo/sign_in_repo.dart';
import 'package:ulearning_app/global.dart';
import 'package:ulearning_app/main.dart';

class SignInController {
  // WidgetRef ref;

  // SignInController(
  //   this.ref,
  // );

  SignInController();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> handleSignIn(WidgetRef ref) async {
    var state = ref.read(signInNotifierProvider);
    String email = state.email;
    String password = state.password;

    emailController.text = email;
    passwordController.text = password;

    if (state.email.isEmpty || email.isEmpty) {
      toastInfo('Your name is empty');
      return;
    }

    if ((state.password.isEmpty) || password.isEmpty) {
      toastInfo('Your password is empty');
      return;
    }
    ref.read(appLoaderProvider.notifier).setLoaderValue(true);
    // print('0');
    try {
      // print('00');
      // final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      //   email: email,
      //   password: password,
      // );
      final credential = await SignInRepo.firebaseSignIn(email, password);

      // print('1');
      if (credential.user == null) {
        toastInfo('User not found');
      }

      if (!credential.user!.emailVerified) {
        toastInfo('You must verify your email address first !');
      }

      var user = credential.user;
      // print('3');
      if (user != null) {
        // print('5');
        String? displayName = user.displayName;
        String? email = user.email;
        String? id = user.uid;
        String? photoUrl = user.photoURL;

        LoginRequestEntity loginRequestEntity = LoginRequestEntity();
        loginRequestEntity.avatar = photoUrl;
        loginRequestEntity.name = displayName;
        loginRequestEntity.email = email;
        loginRequestEntity.open_id = id;
        loginRequestEntity.type = 1;
        asyncPostAllData(loginRequestEntity);
        // print('user logged in');
      } else {
        toastInfo('login error');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        toastInfo('User not found');
      } else if (e.code == 'wrong-password') {
        toastInfo('Your password is wrong');
      }
      // print(e.code);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }

    ref.read(appLoaderProvider.notifier).setLoaderValue(false);
  }

  void asyncPostAllData(LoginRequestEntity loginRequestEntity) async {
    // we need to talk to server
    // HttpUtil().post('api/login');
    var result = await SignInRepo.login(params: loginRequestEntity);
    if (result.code == 200) {
      // have local storage
      try {
        // var navigator = Navigator.of(ref.context);
        // try to remember user info
        Global.storageService.setString(
          AppConstants.STORAGE_USER_PROFILE_KEY,
          jsonEncode(
            result.data,
            // {
            //   "name": "JiYoung",
            //   "email": "jyr@bullets.co.kr",
            //   "age": 34,
            // },
          ),
        );
        Global.storageService.setString(
          AppConstants.STORAGE_USER_TOKEN_KEY,
          result.data!.access_token!,
          // "123456",
        );

        // navigator.pushNamedAndRemoveUntil(
        //   '/application',
        //   (route) => false,
        // );
        navKey.currentState?.pushNamedAndRemoveUntil(
          '/application',
              (route) => false,
        );
        // navigator.pushNamed(
        //   '/application',
        // );
        // navigator.push(
        //   MaterialPageRoute(
        //     builder: (BuildContext context) => Scaffold(
        //       appBar: AppBar(),
        //       body: const Application(),
        //     ),
        //   ),
        // );
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
        }
      }
    } else {
      toastInfo('Login error');
    }
  }
}
