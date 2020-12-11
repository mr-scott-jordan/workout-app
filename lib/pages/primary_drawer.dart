import 'package:flutter/material.dart';
import 'package:workout_app/pages/equipment_page.dart';
import 'package:workout_app/widgets/formatted_button.dart';

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
        FormattedButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/');
          },
          buttonText: "Main Menu",
        ),
        SizedBox(
          height: 50,
        ),
        FormattedButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, EquipmentPage.routeName);
          },
          buttonText: "New Workout",
        ),
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
