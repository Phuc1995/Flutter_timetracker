import 'package:flutter/material.dart';
import 'package:time_tracker/app/sign_in/email_sign_in_form.dart';
import 'package:time_tracker/services/auth.dart';

class EmailSignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
        elevation: 3.0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
          child: Card(child: EmailSignInForm(),
          shadowColor: Colors.redAccent,)
      ),
      backgroundColor: Colors.blueGrey[100],
    );
  }

}
