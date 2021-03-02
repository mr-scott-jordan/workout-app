import 'package:flutter/material.dart';

import 'formatted_button.dart';
import '../pages/equipment_page.dart';

class PrimaryDrawer extends StatelessWidget {
  // final Text text;
  // PrimaryDrawer(this.text);
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      // color: Color(0xFF37474F),
      color: Color(0xff212121),
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
          SizedBox(
            height: 50,
          ),
          FormattedButton(
            onPressed: () {
              // Navigator.pushReplacementNamed(context, EquipmentPage.routeName);
            },
            buttonText: "Logout",
          ),
        ],
      ),
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
