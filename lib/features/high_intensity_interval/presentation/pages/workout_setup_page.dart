// import 'package:flutter/material.dart';

// import '../../../../enums/tags.dart';
// import '../../../../model/workout.dart';
// import '../widgets/formatted_button.dart';
// import 'bulletin_board_page.dart';
// import 'primary_drawer.dart';

// // ignore: must_be_immutable
// class WorkoutSetupPage extends StatefulWidget {
//   static const routeName = 'workout-setup-page';
//   Workout workout;

//   WorkoutSetupPage(
//     this.workout,
//   );
//   @override
//   _WorkoutSetupPageState createState() => _WorkoutSetupPageState();
// }

// class _WorkoutSetupPageState extends State<WorkoutSetupPage>
//     with SingleTickerProviderStateMixin {
//   AnimationController _animationController;

//   String _exerciseDuration;
//   String _restDuration;
//   String _numberOfExercises;
//   String _numberOfRounds;

//   bool _fullbody;
//   bool _push;
//   bool _pull;
//   bool _legs;
//   bool _core;

//   Widget _buildDropDown(
//     String title,
//     String stateValue,
//     List<String> possibleValues,
//     Function onChanged,
//   ) {
//     return Column(
//       children: [
//         Text(title),
//         Container(
//           width: 150,
//           // height: 100,
//           child: DropdownButton(
//             dropdownColor: Color(0xff424242),
//             value: stateValue,
//             elevation: 4,
//             underline: Container(
//               color: Colors.purple,
//               height: 2,
//             ),
//             onChanged: onChanged,
//             items: possibleValues
//                 .map(
//                   (e) => DropdownMenuItem(child: Text(e), value: e),
//                 )
//                 .toList(),
//           ),
//         ),
//       ],
//     );
//   }

//   @override
//   void initState() {
//     _animationController =
//         AnimationController(vsync: this, duration: Duration(milliseconds: 300));
//     _exerciseDuration = '00:45';
//     _restDuration = '00:10';
//     _numberOfExercises = '6';
//     _numberOfRounds = '4';
//     _pull = false;
//     _push = false;
//     _core = false;
//     _legs = false;
//     _fullbody = false;
//     super.initState();
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
//     var minutes;
//     var seconds;
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
//                 backgroundColor: Color(0xff424242),
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
//                     children: [
//                       Expanded(
//                         flex: 1,
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 Text(
//                                   'Total Workout Duration:',
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     color: Color(0xfffbc02d),
//                                   ),
//                                 ),
//                                 Text(
//                                   (widget.workout.totalDuration
//                                       .toString()
//                                       .split('.')[0]),
//                                   style: TextStyle(
//                                     fontSize: 24,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             Container(
//                               height: 2.0,
//                               width: double.infinity,
//                               color: Colors.purple,
//                             ),
//                           ],
//                         ),
//                       ),
//                       Expanded(
//                         flex: 8,
//                         child: SingleChildScrollView(
//                           child: Container(
//                             width: double.infinity,
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 _buildDropDown(
//                                   'Exercise Duration',
//                                   _exerciseDuration,
//                                   [
//                                     '00:45',
//                                     '01:00',
//                                     '01:15',
//                                     '01:30',
//                                   ],
//                                   (newValue) {
//                                     setState(() {
//                                       _exerciseDuration = newValue;
//                                       minutes = int.parse(
//                                           _exerciseDuration.split(':')[0]);
//                                       seconds = int.parse(
//                                           _exerciseDuration.split(':')[1]);
//                                       widget.workout.exerciseDuration =
//                                           Duration(
//                                               minutes: minutes,
//                                               seconds: seconds);
//                                     });
//                                   },
//                                 ),
//                                 _buildDropDown(
//                                   'Rest Duration',
//                                   _restDuration,
//                                   [
//                                     '00:05',
//                                     '00:10',
//                                     '00:15',
//                                     '00:20',
//                                   ],
//                                   (newValue) {
//                                     setState(() {
//                                       _restDuration = newValue;
//                                       minutes = int.parse(
//                                           _restDuration.split(':')[0]);
//                                       seconds = int.parse(
//                                           _restDuration.split(':')[1]);
//                                       widget.workout.restDuration = Duration(
//                                           minutes: minutes, seconds: seconds);
//                                     });
//                                   },
//                                 ),
//                                 _buildDropDown(
//                                   'Number of Exercises',
//                                   _numberOfExercises,
//                                   [
//                                     '3',
//                                     '4',
//                                     '5',
//                                     '6',
//                                   ],
//                                   (newValue) {
//                                     setState(() {
//                                       _numberOfExercises = newValue;
//                                       widget.workout.numOfExercises =
//                                           int.parse(_numberOfExercises);
//                                     });
//                                   },
//                                 ),
//                                 _buildDropDown(
//                                   'Number of Rounds',
//                                   _numberOfRounds,
//                                   [
//                                     '3',
//                                     '4',
//                                     '5',
//                                     '6',
//                                   ],
//                                   (newValue) {
//                                     setState(() {
//                                       _numberOfRounds = newValue;
//                                       widget.workout.numOfRounds =
//                                           int.parse(_numberOfRounds);
//                                     });
//                                   },
//                                 ),
//                                 SwitchListTile(
//                                     activeColor: Color(0xfffbc02d),
//                                     title: Text('Push'),
//                                     value: _push,
//                                     onChanged: (value) {
//                                       setState(() {
//                                         _push = value;
//                                         value
//                                             ? widget.workout.tags.add(Tags.Push)
//                                             : widget.workout.tags
//                                                 .remove(Tags.Push);
//                                         print(_push);
//                                       });
//                                     }),
//                                 SwitchListTile(
//                                     activeColor: Color(0xfffbc02d),
//                                     title: Text('Pull'),
//                                     value: _pull,
//                                     onChanged: (value) {
//                                       setState(() {
//                                         _pull = value;
//                                         value
//                                             ? widget.workout.tags.add(Tags.Pull)
//                                             : widget.workout.tags
//                                                 .remove(Tags.Pull);
//                                         print(_pull);
//                                       });
//                                     }),
//                                 SwitchListTile(
//                                     activeColor: Color(0xfffbc02d),
//                                     title: Text('Legs'),
//                                     value: _legs,
//                                     onChanged: (value) {
//                                       setState(() {
//                                         _legs = value;
//                                         value
//                                             ? widget.workout.tags.add(Tags.Legs)
//                                             : widget.workout.tags
//                                                 .remove(Tags.Legs);
//                                         print(_legs);
//                                       });
//                                     }),
//                                 SwitchListTile(
//                                     activeColor: Color(0xfffbc02d),
//                                     title: Text('Core'),
//                                     value: _core,
//                                     onChanged: (value) {
//                                       setState(() {
//                                         _core = value;
//                                         value
//                                             ? widget.workout.tags.add(Tags.Core)
//                                             : widget.workout.tags
//                                                 .remove(Tags.Core);
//                                         print(_core);
//                                       });
//                                     }),
//                                 SwitchListTile(
//                                     activeColor: Color(0xfffbc02d),
//                                     title: Text('FullBody'),
//                                     value: _fullbody,
//                                     onChanged: (value) {
//                                       setState(() {
//                                         _fullbody = value;
//                                         value
//                                             ? widget.workout.tags
//                                                 .add(Tags.FullBody)
//                                             : widget.workout.tags
//                                                 .remove(Tags.FullBody);
//                                         print(_fullbody);
//                                       });
//                                     }),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         flex: 1,
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
//                                 Navigator.pushNamed(
//                                   context,
//                                   BulletinBoardPage.routeName,
//                                 );
//                               },
//                               buttonText: "Load Workout",
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
