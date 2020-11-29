import 'package:flutter/material.dart';

class EquipmentPage extends StatelessWidget {
  static const routeName = 'equipment-page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        centerTitle: true,
        title: Text('Workout App'),
      ),
      body: Center(
        child: Text('Equipment Page'),
      ),
    );
  }
}
