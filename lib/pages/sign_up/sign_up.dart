import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/global_loader/global_loader.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/app_bar.dart';
import 'package:ulearning_app/common/widgets/app_textfields.dart';
import 'package:ulearning_app/common/widgets/button_widgets.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/pages/sign_up/notifier/register_notifier.dart';
import 'package:ulearning_app/pages/sign_up/sign_up_controller.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({super.key});

  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  late SignUpController _controller;

  @override
  void initState() {
    _controller = SignUpController(ref: ref);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final regProvider = ref.watch(registerNotifierProvider);
    final loader = ref.watch(appLoaderProvider);
    print(loader);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: buildAppBar(
            title: 'Sign up',
          ),
          backgroundColor: Colors.white,
          body: loader == false
              ? SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30.h,
                      ),
                      // more login options message
                      Center(
                        child: text14Normal(
                          text: 'Enter your details below & free sign up',
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      // user name text box
                      appTextField(
                        text: 'User name',
                        iconName: ImageRes.user,
                        hintText: 'Enter your user name',
                        func: (value) => ref
                            .read(registerNotifierProvider.notifier)
                            .onUserNameChange(value),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // email text box
                      appTextField(
                        text: 'Email',
                        iconName: ImageRes.user,
                        hintText: 'Enter your email address',
                        func: (value) => ref
                            .read(registerNotifierProvider.notifier)
                            .onUserEmailChange(value),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // password text box
                      appTextField(
                        text: 'Password',
                        iconName: ImageRes.lock,
                        hintText: 'Enter your password',
                        obscureText: true,
                        func: (value) => ref
                            .read(registerNotifierProvider.notifier)
                            .onUserPasswordChange(value),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // password text box
                      appTextField(
                        text: 'Confirm Password',
                        iconName: ImageRes.lock,
                        hintText: 'Confirm your password',
                        obscureText: true,
                        func: (value) => ref
                            .read(registerNotifierProvider.notifier)
                            .onUserRePasswordChange(value),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // forgot text
                      Container(
                        margin: const EdgeInsets.only(left: 25),
                        child: text14Normal(
                          text:
                              'By creating an account you are agreeing with our terms and conditions',
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      // app register button
                      Center(
                        child: appButton(
                          buttonName: 'Register',
                          isLogin: true,
                          context: context,
                          func: () => _controller.handleSignUp(),
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
