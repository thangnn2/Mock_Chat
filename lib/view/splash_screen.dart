import 'package:flutter/material.dart';
import 'package:flutter_test_project/config/constants.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "SplashScreen";
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              color1,
              color2
            ]
        )
      ),
    );
  }
}
