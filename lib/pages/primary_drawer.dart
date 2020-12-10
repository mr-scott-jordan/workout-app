import 'package:flutter/material.dart';
import 'package:workout_app/pages/equipment_page.dart';

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
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
            ),
            child: Text('Main Menu'),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
            ),
            child: Text('New Workout'),
            onPressed: () {
              Navigator.pushReplacementNamed(context, EquipmentPage.routeName);
            },
          )
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
