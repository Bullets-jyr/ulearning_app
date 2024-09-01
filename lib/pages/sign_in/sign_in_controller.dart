import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/pages/sign_in/notifier/sign_in_notifier.dart';

class SignInController {
  WidgetRef ref;

  SignInController(
    this.ref,
  );

  void handleSignIn() {
    var state = ref.read(signInNotifierProvider);
    String email = state.email;
    String password = state.password;

    print('my email address is $email');
    print('my password is $password');
  }
}
