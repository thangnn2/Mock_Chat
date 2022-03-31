import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_project/bloc/authentication/signin/sign_in_bloc.dart';
import 'package:flutter_test_project/view/home_screen.dart';
import 'package:flutter_test_project/view/login/sign_up_screen.dart';
import 'package:flutter_test_project/widget/button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../config/constants.dart';
import '../../widget/textFormField.dart';

class LogInScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  static String routeName = "LogInScreen";

  LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: BlocBuilder<SignInBloc, SignInState>(
        builder: (context, state) {
          if (state is SignInSuccess) {
            WidgetsBinding.instance!.addPostFrameCallback((_) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) => HomeScreen()),
                  ModalRoute.withName('HomeScreen')
              );
            });
          } else if (state is SignInLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 150),
                  Text("Trải nghiệm Awesome chat",
                      style:
                          TextStyle(fontWeight: FontWeight.w300, fontSize: 24)),
                  SizedBox(height: 15),
                  Text("Đăng nhập",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                          color: color1)),
                  SizedBox(height: 45),
                  BuildTextFormField(
                      controller: emailController,
                      obscureText: false,
                      hintText: "Enter your email",
                      labelText: "Enter",
                      iconData: Icons.email,
                  textInputType: TextInputType.emailAddress),
                  SizedBox(height: 20),
                  BuildTextFormField(
                    controller: passwordController,
                    obscureText: true,
                    hintText: "Enter your password",
                    labelText: "Password",
                    iconData: Icons.key,
                    textInputType: TextInputType.text,
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text("Quên mật khẩu?",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: color1)),
                  ),
                  SizedBox(height: 80),
                  BottomButton(
                      text: "Sign In",
                      color: color1,
                      textColor: Colors.white,
                      press: () {
                        context.read<SignInBloc>().add(PressSignInButton(
                            email: emailController.text,
                            password: passwordController.text));
                      }),
                  SizedBox(height: 100),
                  Align(
                      alignment: Alignment.center,
                      child: RichText(
                        text: TextSpan(
                          text: "Chưa có tài khoản? ",
                          style: TextStyle(
                              color: color1,
                              fontSize: 15,
                              fontWeight: FontWeight.w300),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Đăng ký ngay',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: color1,
                                    fontSize: 15),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                     Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => SignUpScreen()),
                                    );
                                  }),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
