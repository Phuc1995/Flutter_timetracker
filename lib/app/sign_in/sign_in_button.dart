import 'package:flutter/material.dart';
import 'package:time_tracker/common_widgets/custom_raised_button.dart';

class SignInButton extends CustomRaiseButton {
  SignInButton(
      {String text, Color color, Color textColor, VoidCallback onPressed})
      : assert(text != null),
        super(
            child: Text(
              text,
              style: TextStyle(color: textColor, fontSize: 15.0),
            ),
            color: color,
            boderRadius: 16.0,
            onPressed: onPressed);
}
