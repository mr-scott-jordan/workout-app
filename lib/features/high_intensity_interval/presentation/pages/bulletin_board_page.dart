// import 'package:flutter/material.dart';
// import 'package:workout_app/exercise_data.dart';
// import 'package:workout_app/features/high-intensity-interval/domain/entities/workout.dart';

// // ignore: must_be_immutable
// class BulletinBoardPage extends StatefulWidget {
//   static const routeName = 'bulletin-board-page';
//   Workout workout;

//   BulletinBoardPage(this.workout);

//   @override
//   _BulletinBoardPageState createState() => _BulletinBoardPageState();
// }

// class _BulletinBoardPageState extends State<BulletinBoardPage>
//     with SingleTickerProviderStateMixin {
//   AnimationController _animationController;

//   @override
//   void initState() {
//     super.initState();
//     _animationController =
//         AnimationController(vsync: this, duration: Duration(milliseconds: 300));
//     widget.workout.generateWorkout();
//   }

//   _toggleAnimation() {
//     _animationController.isDismissed
//         ? _animationController.forward()
//         : _animationController.reverse();
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final rightSlide = MediaQuery.of(context).size.width * 0.6;
//     widget.workout.setWorkoutDuration();
//     var potentialExercises =
//         List.generate(EXERCISES_DATA.length, (index) => EXERCISES_DATA[index]);
//     potentialExercises.shuffle();
//     return AnimatedBuilder(
//       animation: _animationController,
//       builder: (context, child) {
//         double slide = rightSlide * _animationController.value;
//         double scale = 1 - (_animationController.value * 0.3);
//         return Stack(
//           children: [
//             Scaffold(
//               backgroundColor: const Color(0xff424242),
//               body: PrimaryDrawer(),
//             ),
//             Transform(
//               transform: Matrix4.identity()
//                 ..translate(slide)
//                 ..scale(scale),
//               alignment: Alignment.center,
//               child: Scaffold(
//                 appBar: PreferredSize(
//                   preferredSize: Size.fromHeight(35),
//                   child: Container(
//                     decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                             begin: Alignment.topRight,
//                             end: Alignment.bottomLeft,
//                             colors: [Colors.blue[400], Colors.purple])),
//                     // color: const Color(0xffee5253),
//                     child: Padding(
//                       padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           IconButton(
//                             onPressed: () => _toggleAnimation(),
//                             icon: AnimatedIcon(
//                               icon: AnimatedIcons.menu_close,
//                               progress: _animationController,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 body: Container(
//                   color: Color(0xff424242),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Expanded(
//                           flex: 1,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               Text(
//                                 (widget.workout.totalDuration
//                                     .toString()
//                                     .split('.')[0]),
//                                 style: TextStyle(
//                                   fontSize: 24,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               Container(
//                                 height: 2.0,
//                                 width: double.infinity,
//                                 color: Colors.purple,
//                               ),
//                             ],
//                           )),
//                       Expanded(
//                         flex: 7,
//                         child: ListView.builder(
//                           itemCount: widget.workout.exercises.length,
//                           itemBuilder: (BuildContext context, int index) {
//                             return ListTile(
//                               // leading: Text(
//                               //   workout.exercises[index].title,
//                               //   style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
//                               // ),
//                               title: Text(
//                                 widget.workout.exercises[index].title,
//                                 style: TextStyle(
//                                     fontSize: 17, fontWeight: FontWeight.bold),
//                               ),
//                               trailing: Container(
//                                 width: MediaQuery.of(context).size.width / 2,
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.end,
//                                   children: [
//                                     IconButton(
//                                         icon: Icon(Icons.swap_calls_rounded),
//                                         onPressed: () {
//                                           setState(() {
//                                             widget.workout.exercises[index] =
//                                                 potentialExercises.firstWhere(
//                                                     (element) =>
//                                                         element !=
//                                                         widget.workout
//                                                             .exercises[index]);
//                                           });
//                                         }),
//                                     IconButton(
//                                         icon: Icon(Icons.delete),
//                                         onPressed: () {
//                                           setState(() {
//                                             var didRemove = widget
//                                                 .workout.exercises
//                                                 .removeAt(index);
//                                             widget.workout.numOfExercises =
//                                                 widget.workout.numOfExercises -
//                                                     1;
//                                             print(didRemove);
//                                           });
//                                         }),
//                                   ],
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                       Expanded(
//                         flex: 2,
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             Container(
//                               height: 2.0,
//                               width: double.infinity,
//                               color: Colors.purple,
//                             ),
//                             FormattedButton(
//                               onPressed: () {
//                                 setState(() {
//                                   widget.workout.generateWorkout();
//                                 });
//                               },
//                               buttonText: "Regenerate Workout",
//                             ),
//                             FormattedButton(
//                               onPressed: () {
//                                 Navigator.pushNamed(
//                                   context,
//                                   WorkoutPage.routeName,
//                                 );
//                               },
//                               buttonText: "Begin Workout",
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
