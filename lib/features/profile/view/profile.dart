import 'package:flutter/material.dart';
import 'package:ulearning_app/common/widgets/app_bar.dart';
import 'package:ulearning_app/features/profile/view/widget/profile_widgets.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    print('-----build Profile-----');
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildGlobalAppBar(
        title: 'Profile',
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ProfileImageWidget(),
              ProfileNameWidget(),
              ProfileDescriptionWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
