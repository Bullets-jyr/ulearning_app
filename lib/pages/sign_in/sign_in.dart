import 'package:flutter/material.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/pages/sign_in/widgets/sign_in_widgets.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: buildAppBar(),
          backgroundColor: Colors.white,
          body: Column(
            children: [
              // top login buttons
              thirdPartyLogin(),
              // more login options message
              text14Normal(
                text: 'Or use your email account to login',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
