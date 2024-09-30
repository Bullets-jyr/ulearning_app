import 'package:flutter/material.dart';
import 'package:ulearning_app/common/widgets/app_bar.dart';

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
    );
  }
}
