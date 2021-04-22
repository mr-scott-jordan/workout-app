import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../../core/authentication/bloc/user_bloc.dart';
import '../../domain/entities/exercise.dart';
// import '../../domain/entities/workout.dart';
// import '../bloc/workout_bloc.dart';
// import '../widgets/formatted_button.dart';
// import '../widgets/page_animation_widget.dart';
// import '../widgets/timer.dart';
// import 'login_page.dart';
// import 'workout_summary_page.dart';
//import '../'

// ignore: must_be_immutable
class ExerciseModal extends StatelessWidget {
  static const routeName = '/exercise-modal-page';
  final CountDownController controller = CountDownController();
  List<Exercise> exercises;

  @override
  Widget build(BuildContext context) {
    return Image(image: AssetImage('assets/gifs/Pushup.gif'));
  }
}
