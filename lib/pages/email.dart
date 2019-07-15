import 'package:flutter/material.dart';

class Email extends StatelessWidget {
  const Email({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("eamil"),
      ),
      body: Center(child: Text('email'),),
    );
  }
}