import 'package:flutter/material.dart';
import 'package:flutter_test_project/data/repository/authentication_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/authentication/authentication/authentication_bloc.dart';

class HomeScreen extends StatelessWidget {
  final AuthenticationRepo authenticationRepo = AuthenticationRepo();

  static String routeName = "HomeScreen";

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Appbar"),
            elevation: 0,
            actions: [
              IconButton(
                  onPressed: () {
                    context.read<AuthenticationBloc>().add(AuthenticationLogOuted());
                  },
                  icon: Icon(Icons.logout_outlined))
            ],
          ),
          backgroundColor: Colors.white,
          body: Center(child: Text("HomeScreen")),
        );
      },
    );
  }
}
