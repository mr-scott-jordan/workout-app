import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_app/core/authentication/authentication_service.dart';

import '../bloc/workout_bloc.dart';
import '../widgets/formatted_button.dart';
import '../widgets/page_animation_widget.dart';
import 'equipment_page.dart';
// import 'equipment_page.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // void _signInAnonymously() async {
  //   try {
  //     final userCredentials = await FirebaseAuth.instance.signInAnonymously();
  //     print('${userCredentials.user.uid}');
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  static const routeName = '/';
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
                  // ignore: deprecated_member_use
                  RaisedButton(
                    onPressed: () {
                      context.read<AuthenticationService>().signIn(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          );
                    },
                    child: Text("Sign in"),
                  )
                  //   SizedBox(
                  //     height: 100,
                  //   ),
                  //   Container(
                  //     child: Icon(
                  //       Icons.fitness_center_rounded,
                  //       size: 150,
                  //     ),
                  //   ),
                  //   SizedBox(
                  //     height: 100,
                  //   ),
                  //   Center(
                  //     child: FormattedButton(
                  //       onPressed: () {},
                  //       buttonText: "Sign in with email",
                  //     ),
                  //   ),
                  // Center(
                  //   child: FormattedButton(
                  //     onPressed: () {
                  //       _signInAnonymously();
                  //       Navigator.pushNamed(context, EquipmentPage.routeName);
                  //     },
                  //     buttonText: "Go Anonymous",
                  //   ),
                  // ),
                ],
              ),
            ),
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
