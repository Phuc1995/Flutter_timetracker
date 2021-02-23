import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Tracker'),
        elevation: 4,
      ),
      body: buildContent(),
    );
  }

  Widget buildContent() {
    return Container(
      color: Colors.yellow,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Colors.black26,
            child: SizedBox(
              width: 100,
              height: 100,
            ),
          ),
          Container(
            color: Colors.red,
            child: SizedBox(
              width: 100,
              height: 100,
            ),
          )
        ],
      ),
    );
  }
}
