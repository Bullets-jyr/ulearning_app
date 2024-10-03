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
import 'package:ulearning_app/features/sign_up/controller/sign_up_controller.dart';
import 'package:ulearning_app/features/sign_up/provider/register_notifier.dart';

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
                      const Center(
                        child: Text14Normal(
                          text: 'Enter your details below & free sign up',
                        ),
                        // child: text14Normal(
                        //   text: 'Enter your details below & free sign up',
                        // ),
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                      // user name text box
                      AppTextField(
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
                      AppTextField(
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
                      AppTextField(
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
                      AppTextField(
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
                        child: const Text14Normal(
                          text:
                              'By creating an account you are agreeing with our terms and conditions',
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      // app register button
                      Center(
                        child: AppButton(
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
