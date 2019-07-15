import 'package:flutter/material.dart';

class Pages extends StatelessWidget {
  const Pages({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("pages"),
      ),
      body: Center(child: Text('pages'),),
    );
  }
}