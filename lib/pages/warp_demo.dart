import 'package:flutter/material.dart';

class WarpDemo extends StatefulWidget {
  WarpDemo({Key key}) : super(key: key);

  _WarpDemoState createState() => _WarpDemoState();
}

class _WarpDemoState extends State<WarpDemo> {
  List<Widget> list;

  @override
  void initState() {
    list = List<Widget>()..add(buildAddButton());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('流式布局'),
      ),
      body: Center(
        child: Opacity(
          opacity: 0.8,
          child: Container(
              width: width,
              height: height / 2,
              color: Colors.blueAccent,
              child: Wrap(
                children: list,
                spacing: 10.0,
              )),
        ),
      ),
    );
  }

  Widget buildAddButton() {
    return GestureDetector(
      onTap: () {
        if (list.length < 9) {
          setState(() {
            list.insert(list.length - 1, buildPohto());
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 80.0,
          height: 80.0,
          color: Colors.black26,
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  Widget buildPohto() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 80.0,
        height: 80.0,
        color: Colors.orange,
        child: Center(
          child: Text('照片'),
        ),
      ),
    );
  }
}
