import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/email.dart';
import 'pages/pages.dart';
import 'pages/aipPlay.dart';

class BottomNavigationWidget extends StatefulWidget {
  BottomNavigationWidget({Key key}) : super(key: key);

  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  final _BottomNavigationColor = Colors.blue;
  int _currentIndex = 0;
  List<Widget> list = List();
  @override
  void initState() {
    list
      ..add(Home())
      ..add(Email())
      ..add(Pages())
      ..add(AipPlay());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _BottomNavigationColor,
            ),
            title: Text(
              'Home',
              style: TextStyle(color: _BottomNavigationColor),
            )
          ),
          BottomNavigationBarItem(
             icon:Icon(
               Icons.email,
               color:_BottomNavigationColor,
             ),
             title:Text(
               'Email',
               style:TextStyle(color:_BottomNavigationColor)
             )
           ),
           BottomNavigationBarItem(
             icon:Icon(
               Icons.pages,
               color:_BottomNavigationColor,
             ),
             title:Text(
               'Pages',
               style:TextStyle(color:_BottomNavigationColor)
             )
           ),
           BottomNavigationBarItem(
             icon:Icon(
               Icons.airplay,
               color:_BottomNavigationColor,
             ),
             title:Text(
               'AipPlay',
               style:TextStyle(color:_BottomNavigationColor)
             )
           ),
        ],
        currentIndex: _currentIndex,
        onTap: (int index){
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}