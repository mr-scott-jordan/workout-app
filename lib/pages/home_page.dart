import 'package:flutter/material.dart';
import 'package:workout_app/pages/equipment_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        centerTitle: true,
        title: Text('Workout App'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Container(
            child: Icon(Icons.fitness_center, size: 150),
          ),
          SizedBox(
            height: 100,
          ),
          Center(
            child: RaisedButton(
              child: Text('Load Workout'),
              onPressed: () {
                Navigator.pushNamed(context, EquipmentPage.routeName);
              },
            ),
          ),
        ],
      ),
    );
  }
}
