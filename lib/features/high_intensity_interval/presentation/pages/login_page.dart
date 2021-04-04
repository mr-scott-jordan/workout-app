import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/flutter_login.dart';

import '../../../../core/authentication/authentication_service.dart';
import '../bloc/workout_bloc.dart';

class LoginPage extends StatelessWidget {
  static const routeName = '/login-page';

  void _signInAnonymously() async {
    try {
      final userCredentials = await FirebaseAuth.instance.signInAnonymously();
      print('${userCredentials.user.uid}');
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutBloc, WorkoutState>(
      builder: (context, state) {
        if (state is WorkoutLoadedState) {
          return FlutterLogin(
            logo: 'assets/images/love_hate_logo.png',
            theme: LoginTheme(
              errorColor: Colors.orangeAccent,
              cardTheme: CardTheme(
                color: Color.fromRGBO(96, 92, 96, .8),
              ),
              accentColor: Colors.purple,
              textFieldStyle: TextStyle(
                color: Colors.white,
              ),
            ),
            onLogin: (LoginData data) {
              return context.read<AuthenticationService>().signIn(
                    email: data.name,
                    password: data.password,
                  );
            },
            onRecoverPassword: (_) {
              return Future.delayed(Duration(seconds: 1))
                  .then((value) => "To Be Implemented");
            },
            onSignup: (LoginData data) {
              return context.read<AuthenticationService>().signUp(
                    email: data.name,
                    password: data.password,
                  );
            },
          );
        } else {
          return Center(
            child: Text(
                'You need to investigate why WorkoutLoadedState is being streamed'),
          );
        }
      },
    );
  }
}
