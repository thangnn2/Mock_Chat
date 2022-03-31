import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_project/view/login/login_screen.dart';
import '../../bloc/authentication/signup/sign_up_bloc.dart';
import '../../config/constants.dart';
import '../../widget/button.dart';
import '../../widget/textFormField.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController registerName = TextEditingController();
  final TextEditingController registerEmailController = TextEditingController();
  final TextEditingController registerPasswordController = TextEditingController();

  static String routeName = "SignUpScreen";

  SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: color1),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: BlocConsumer<SignUpBloc, SignUpState>(
        listener: (context, state) {
          if (state is SignUpLoading) {
            Center(child: CircularProgressIndicator());
          } else if (state is SignUpFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Sign Up Failed")));
          } else if (state is SignUpSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Sign Up Successfully")));
            WidgetsBinding.instance!.addPostFrameCallback((_) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) => LogInScreen()),
                  ModalRoute.withName('LogInScreen')
              );
            });
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50),
                  Text("Đăng ký",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                          color: color1)),
                  SizedBox(height: 80),
                  BuildTextFormField(
                    controller: registerName,
                    obscureText: false,
                    hintText: "Enter your name",
                    labelText: "Name",
                    iconData: Icons.person,
                    textInputType: TextInputType.text,
                  ),
                  SizedBox(height: 20),
                  BuildTextFormField(
                      controller: registerEmailController,
                      obscureText: false,
                      hintText: "Enter your email",
                      labelText: "Email",
                      iconData: Icons.email,
                  textInputType: TextInputType.emailAddress,),
                  SizedBox(height: 20),
                  SizedBox(height: 20),
                  BuildTextFormField(
                    controller: registerPasswordController,
                    obscureText: true,
                    hintText: "Enter your password",
                    labelText: "Password",
                    iconData: Icons.key,
                    textInputType: TextInputType.text,
                  ),
                  SizedBox(height: 80),
                  BottomButton(
                      text: "Sign up",
                      color: color1,
                      textColor: Colors.white,
                      press: () {
                        context.read<SignUpBloc>().add(PressSignUpButton(
                            name: registerName.text,
                            email: registerEmailController.text,
                            password: registerPasswordController.text));
                      }),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
