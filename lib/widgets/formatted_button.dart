import 'package:flutter/material.dart';

class FormattedButton extends StatelessWidget {
  final String buttonText;
  final Function onPressed;

  FormattedButton({@required this.onPressed, this.buttonText});

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
