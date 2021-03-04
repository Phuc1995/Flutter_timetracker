import 'package:flutter/material.dart';

class EmailSignInForm extends StatelessWidget {
  List<Widget> _buildChildren() {
    return [
      TextField(
        decoration: InputDecoration(labelText: "Email", hintText: "abc@gmail"),
      ),
      TextField(
        decoration: InputDecoration(labelText: "Password"),
        obscureText: true,
      ),
      RaisedButton(child: Text('Sign In'), onPressed: () {}),
      FlatButton(child: Text('Need a account? Register'), onPressed: () {})
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: _buildChildren(),
      ),
    );
  }
}
