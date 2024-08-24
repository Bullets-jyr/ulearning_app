import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            child: Text(
              'Widget one',
            ),
            // bottom: 100,
            // left: 20,
          ),
          Positioned(
            child: Text(
              'Widget one',
              style: TextStyle(
                fontSize: 50,
              ),
            ),
            bottom: 200,
            left: 200,
          ),
        ],
      ),
    );
  }
}
