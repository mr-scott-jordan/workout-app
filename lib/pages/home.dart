import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Workout App'),
      ),
      body: Center(
        child: Text('Home Page'),
      ),
    );
  }
}
