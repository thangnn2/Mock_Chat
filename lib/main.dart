import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test_project/bloc/authentication/authentication/authentication_bloc.dart';
import 'package:flutter_test_project/bloc/authentication/signup/sign_up_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_project/routes.dart';
import 'package:flutter_test_project/view/home_screen.dart';
import 'package:flutter_test_project/view/login/login_screen.dart';
import 'bloc/authentication/signin/sign_in_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider (
          create: (BuildContext context) => AuthenticationBloc()..add(AppStart()),
        ),
        BlocProvider (
          create: (BuildContext context) => SignUpBloc(),
        ),
        BlocProvider (
          create: (BuildContext context) => SignInBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: route,
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (BuildContext context, state) {
            if (state is AuthenticationSuccess) {
              return HomeScreen();
            }
            else if (state is AuthenticationFailure) {
              return LogInScreen();
            }
            return LogInScreen();
          },),
      ),
    );
  }
}
