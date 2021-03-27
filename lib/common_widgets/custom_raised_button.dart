import 'package:flutter/material.dart';

class CustomRaiseButton extends StatelessWidget {
  final Widget child;
  final Color color;
  final double boderRadius;
  final VoidCallback onPressed;
  final double height;

  CustomRaiseButton(
      {Key key, this.color, this.boderRadius : 4.0, this.onPressed, this.child, this.height:50.0}): assert(boderRadius != null);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: RaisedButton(
          child: child,
          color: color,
          disabledColor: color,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(boderRadius))),
          onPressed: onPressed),
    );
  }
}
