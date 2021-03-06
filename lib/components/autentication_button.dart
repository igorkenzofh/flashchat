import 'package:flutter/material.dart';

class AutentButton extends StatelessWidget {
  final Color bgButtonColor;
  final Function buttonFunction;
  final String buttonText;

  AutentButton({this.bgButtonColor, this.buttonFunction, this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: bgButtonColor,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: buttonFunction,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            '$buttonText',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
