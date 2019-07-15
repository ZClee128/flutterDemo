import 'package:flutter/material.dart';
import 'pages/eachView.dart';
class BottomAppbarDemo extends StatefulWidget {
  BottomAppbarDemo({Key key}) : super(key: key);

  _BottomAppbarDemoState createState() => _BottomAppbarDemoState();
}

class _BottomAppbarDemoState extends State<BottomAppbarDemo> {

  List<Widget> list = List();
  int _index = 0;          //数组索引，通过改变索引值改变视图
  @override
  void initState() {
    list
      ..add(EachView('home'))
      ..add(EachView('watch'));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[_index],
      floatingActionButton: FloatingActionButton(
        onPressed: (){
            Navigator.push(context, MaterialPageRoute(
              builder: (BuildContext context){
                return EachView('加');
              }
            ));
        },
        tooltip: 'Increment',
        child: Icon(
          Icons.local_hospital,
          color:Colors.white
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightBlue,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              color: Colors.white,
              onPressed: (){
                setState(() {
                  _index = 0;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.watch),
              color: Colors.white,
              onPressed: (){
                setState(() {
                  _index = 1;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}