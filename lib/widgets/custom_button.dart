import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Function onPressed;

  CustomButton({@required this.onPressed, this.buttonText});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
        shadowColor: MaterialStateProperty.all<Color>(Colors.white),
      ),
      onPressed: onPressed,
      child: Text(buttonText),
    );
  }
}
