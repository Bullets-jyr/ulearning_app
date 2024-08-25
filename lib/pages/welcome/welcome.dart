import 'package:flutter/material.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/pages/welcome/widgets.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            scrollDirection: Axis.horizontal,
            children: [
              // first page
              appOnboardingPage(
                imagePath: 'assets/images/reading.png',
                title: 'First See Learning',
                subTitle: 'Forget about the paper, now learning all in one place',
              ),
              // second page
              appOnboardingPage(
                imagePath: 'assets/images/reading.png',
                title: 'First See Learning',
                subTitle: '',
              ),
            ],
          ),
          const Positioned(
            child: Text(
              'Widget one',
            ),
            left: 20,
            bottom: 100,
          ),
        ],
      ),
    );
  }
}
