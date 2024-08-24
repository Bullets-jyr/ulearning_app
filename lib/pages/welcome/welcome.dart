import 'package:flutter/material.dart';

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
              Container(
                width: 345,
                height: 345,
                child: Image.asset('assets/images/reading.png'),
              ),
              Container(
                width: 345,
                height: 345,
                child: Image.asset('assets/images/reading.png'),
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
          const Positioned(
            child: Text(
              'Widget two',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            top: 100,
            left: 200,
          ),
        ],
      ),
    );
  }
}
