import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/authentication/authentication_service.dart';
import '../bloc/workout_bloc.dart';
import '../widgets/formatted_button.dart';
import '../widgets/page_animation_widget.dart';
import 'equipment_page.dart';
import 'home_page.dart';

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

  static const routeName = '/sign-in-page';
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutBloc, WorkoutState>(
      builder: (context, state) {
        if (state is WorkoutLoadedState) {
          return PageAnimationWidget(
            body: Container(
              color: Color(0xff424242),
              child: Column(
                children: [
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: "Email",
                    ),
                  ),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: "Password",
                    ),
                  ),
                  FormattedButton(
                    onPressed: () {
                      context.read<AuthenticationService>().signIn(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          );
                      Navigator.pushNamed(context, HomePage.routeName);
                    },
                    buttonText: "Sign in",
                  ),
                  FormattedButton(
                    onPressed: () {
                      context.read<AuthenticationService>().signUp(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          );
                      Navigator.pushNamed(context, HomePage.routeName);
                    },
                    buttonText: "Sign up",
                  ),
                  FormattedButton(
                    onPressed: () {
                      _signInAnonymously();
                      Navigator.pushNamed(context, EquipmentPage.routeName);
                    },
                    buttonText: "Go Anonymous",
                  ),
                ],
              ),
            ),
          );
        } else {
          return Center(
            child: Text(' '),
          );
        }
      },
    );
  }
}
