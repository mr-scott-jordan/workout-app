import 'package:flutter/material.dart';
import 'package:workout_app/enums/equipment.dart';
import 'package:workout_app/model/workout.dart';
import 'package:workout_app/pages/primary_drawer.dart';

import '../pages/workout_setup_page.dart';

// ignore: must_be_immutable
class EquipmentPage extends StatefulWidget {
  static const routeName = 'equipment-page';
  Workout workout;

  EquipmentPage(this.workout);

  @override
  _EquipmentPageState createState() => _EquipmentPageState();
}

class _EquipmentPageState extends State<EquipmentPage> {
  bool _pullupBar;
  bool _yogaMat;

  @override
  void initState() {
    _pullupBar = false;
    _yogaMat = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        centerTitle: true,
        title: Text('Equipment Page'),
      ),
      drawer: PrimaryDrawer(),
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Pullup Bar'),
              Switch(
                  value: _pullupBar,
                  onChanged: (value) {
                    setState(() {
                      _pullupBar = value;
                      _pullupBar
                          ? widget.workout.equipment.add(Equipment.PullUpBar)
                          : widget.workout.equipment
                              .remove(Equipment.PullUpBar);
                      // print(widget.workout.equipment[0].toString());
                    });
                  }),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Yoga Mat'),
              Switch(
                  value: _yogaMat,
                  onChanged: (value) {
                    setState(() {
                      _yogaMat = value;
                      _yogaMat
                          ? widget.workout.equipment.add(Equipment.YogaMat)
                          : widget.workout.equipment.remove(Equipment.YogaMat);
                    });
                  }),
            ],
          ),
          Container(
            height: 200,
            width: 200,
            alignment: Alignment.bottomCenter,
            child: RaisedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  WorkoutSetupPage.routeName,
                );
              },
              child: Text('Next'),
            ),
          ),
        ],
      ),
    );
  }
}
