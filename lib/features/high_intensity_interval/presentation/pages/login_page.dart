import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:workout_app/features/high_intensity_interval/presentation/pages/home_page.dart';

import '../../../../core/authentication/authentication_service.dart';
import '../bloc/workout_bloc.dart';
import '../widgets/formatted_button.dart';
import '../widgets/page_animation_widget.dart';
import 'equipment_page.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _signInAnonymously() async {
    try {
      final userCredentials = await FirebaseAuth.instance.signInAnonymously();
      print('${userCredentials.user.uid}');
    } catch (e) {
      print(e.toString());
    }
  }

  Future<String> _authUser(LoginData data) {
    final loginTime = Duration(milliseconds: 2250);

    return Future.delayed(loginTime).then((_) {
context.read<AuthenticationService>().signIn(
                            email: data.name,
                            password: data.password,
                          );
                      Navigator.pushNamed(context, HomePage.routeName);
    });
  }

  static const routeName = '/sign-in-page';
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutBloc, WorkoutState>(
      builder: (context, state) {
        if (state is WorkoutLoadedState) {
          return PageAnimationWidget(
            body: FlutterLogin(onLogin: (LoginData data) {
                      context.read<AuthenticationService>().signIn(
                            email: data.name,
                            password: data.password,
                          );
                      return ''
                    }, onRecoverPassword: (String )  {  return "To Be Implemented"}, onSignup: (LoginData ) {  },),
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
