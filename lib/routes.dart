import 'package:flutter/cupertino.dart';
import 'package:flutter_test_project/view/home_screen.dart';
import 'package:flutter_test_project/view/login/login_screen.dart';
import 'package:flutter_test_project/view/login/sign_up_screen.dart';
import 'package:flutter_test_project/view/splash_screen.dart';

final Map<String, WidgetBuilder> route = {
  SplashScreen.routeName: (context) => SplashScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  LogInScreen.routeName: (context) => LogInScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
};
