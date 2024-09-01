import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/widgets/app_bar.dart';
import 'package:ulearning_app/common/widgets/app_textfields.dart';
import 'package:ulearning_app/common/widgets/button_widgets.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/pages/sign_in/notifier/sign_in_notifier.dart';
import 'package:ulearning_app/pages/sign_in/sign_in_controller.dart';
import 'package:ulearning_app/pages/sign_in/widgets/sign_in_widgets.dart';

class SignIn extends ConsumerStatefulWidget {
  const SignIn({super.key});

  @override
  ConsumerState<SignIn> createState() => _SignInState();
}

class _SignInState extends ConsumerState<SignIn> {
  late SignInController _controller;

  @override
  void initState() {
    _controller = SignInController(ref);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final signInProvider = ref.watch(signInNotifierProvider);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: buildAppBar(
            title: 'Login',
          ),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // top login buttons
                thirdPartyLogin(),
                // more login options message
                Center(
                  child: text14Normal(
                    text: 'Or use your email account to login',
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                // email text box
                appTextField(
                  text: 'Email',
                  iconName: 'assets/icons/user.png',
                  hintText: 'Enter your email address',
                ),
                SizedBox(
                  height: 20,
                ),
                // password text box
                appTextField(
                  text: 'Password',
                  iconName: 'assets/icons/lock.png',
                  hintText: 'Enter your password',
                  obscureText: true,
                ),
                SizedBox(
                  height: 20,
                ),
                // forgot text
                Container(
                  margin: EdgeInsets.only(left: 25),
                  child: textUnderline(text: 'Forgot password'),
                ),
                SizedBox(
                  height: 100,
                ),
                // app login button
                Center(
                  child: appButton(
                    buttonName: 'Login',
                    func: () => _controller.handleSignIn(),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // app register button
                Center(
                  child: appButton(
                    buttonName: 'Register',
                    isLogin: false,
                    context: context,
                    func: () => Navigator.pushNamed(
                      context,
                      '/register',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
