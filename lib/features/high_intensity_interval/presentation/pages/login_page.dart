import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:workout_app/core/authentication/bloc/user_bloc.dart';
import 'package:workout_app/features/high_intensity_interval/presentation/pages/home_page.dart';

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
    return BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserAuthenticatedState) {
            Navigator.pushReplacementNamed(context, HomePage.routeName);
          }
        },
        child: BlocConsumer<WorkoutBloc, WorkoutState>(
          listener: (context, state) {
            if (state is! WorkoutLoadedState) {
              BlocProvider.of<WorkoutBloc>(context)
                  .add(ResetWorkoutEvent(state.getWorkout()));
            }
          },
          builder: (BuildContext context, state) {
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
                BlocProvider.of<WorkoutBloc>(context).add(
                  ResetWorkoutEvent(
                    state.getWorkout(),
                  ),
                );
                BlocProvider.of<UserBloc>(context).add(
                  SignInEvent(
                    email: data.name,
                    password: data.password,
                  ),
                );
                return Future.delayed(Duration(seconds: 1))
                    .then((value) => null);
              },
              onRecoverPassword: (_) {
                return Future.delayed(Duration(seconds: 1))
                    .then((value) => null);
              },
              onSignup: (LoginData data) {
                BlocProvider.of<UserBloc>(context).add(
                  SignUpEvent(
                    email: data.name,
                    password: data.password,
                  ),
                );
                return Future.delayed(Duration(seconds: 1))
                    .then((value) => null);
              },
            );
          },
        ));
  }
}
