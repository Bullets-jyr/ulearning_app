import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/entities/user.dart';
import 'package:ulearning_app/common/global_loader/global_loader.dart';
import 'package:ulearning_app/common/widgets/popup_messages.dart';
import 'package:ulearning_app/pages/sign_in/notifier/sign_in_notifier.dart';

class SignInController {
  WidgetRef ref;

  SignInController(
    this.ref,
  );

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> handleSignIn() async {
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
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
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

  void asyncPostAllData(LoginRequestEntity loginRequestEntity) {
    // we need to talk to server

    // have local storage

    // redirect to new page
  }
}
