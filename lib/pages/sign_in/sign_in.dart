import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/global_loader/global_loader.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
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
    final loader = ref.watch(appLoaderProvider);
    // print(signInProvider.email);
    // print(signInProvider.password);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: buildAppBar(
            title: 'Login',
          ),
          backgroundColor: Colors.white,
          body: loader == false
              ? SingleChildScrollView(
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
                      const SizedBox(
                        height: 50,
                      ),
                      // email text box
                      appTextField(
                        controller: _controller.emailController,
                        text: 'Email',
                        iconName: ImageRes.user,
                        hintText: 'Enter your email address',
                        func: (value) => ref
                            .read(signInNotifierProvider.notifier)
                            .onUserEmailChange(value),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // password text box
                      appTextField(
                        controller: _controller.passwordController,
                        text: 'Password',
                        iconName: ImageRes.lock,
                        hintText: 'Enter your password',
                        obscureText: true,
                        func: (value) => ref
                            .read(signInNotifierProvider.notifier)
                            .onUserPasswordChange(value),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // forgot text
                      Container(
                        margin: const EdgeInsets.only(left: 25),
                        child: textUnderline(text: 'Forgot password'),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      // app login button
                      Center(
                        child: appButton(
                          buttonName: 'Login',
                          func: () => _controller.handleSignIn(),
                        ),
                      ),
                      const SizedBox(
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
                )
              : const Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.blue,
                    color: AppColors.primaryElement,
                  ),
                ),
        ),
      ),
    );
  }
}
