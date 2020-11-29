import 'package:flutter/material.dart';

import '../pages/workout_setup_page.dart';

class EquipmentPage extends StatefulWidget {
  static const routeName = 'equipment-page';

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
                      print(_pullupBar);
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
                      print(_yogaMat);
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
