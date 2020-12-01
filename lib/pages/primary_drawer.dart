import 'package:flutter/material.dart';
import 'package:workout_app/pages/equipment_page.dart';
import 'package:workout_app/pages/home_page.dart';

class PrimaryDrawer extends StatelessWidget {
  // final Text text;
  // PrimaryDrawer(this.text);
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        SizedBox(
          height: 250,
        ),
        RaisedButton(
          child: Text('Main Menu'),
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
        ),
        SizedBox(
          height: 50,
        ),
        RaisedButton(
          child: Text('New Workout'),
          onPressed: () {
            Navigator.pushNamed(context, EquipmentPage.routeName);
          },
        )
      ],
    ));
  }
}

// child: Center(
//           // child: Text('Primary Drawer'),
//           child: RaisedButton(
//               child: Text('Main Menu'),
//               onPressed: () {
//                 Navigator.pushNamed(context, '/');
//               })),