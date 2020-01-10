import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List data = [1,2,3,4,5,6];

    return Scaffold(
        appBar: AppBar(
          title: Text("home"),
        ),
        body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context,int i){
            return Column(
              children: <Widget>[
                TextField(decoration: InputDecoration(hintText: '${data[i]}')),
                TextField(decoration: InputDecoration(hintText: '${data[i]}')),
                TextField(decoration: InputDecoration(hintText: '${data[i]}')),
                TextField(decoration: InputDecoration(hintText: '${data[i]}')),
              ],
            );
          },
        ));
  }
}

class CustomSliverChildDelegate extends SliverChildBuilderDelegate {
  CustomSliverChildDelegate(
    Widget Function(BuildContext, int) builder, {
    int childCount,
    bool addAutomaticKeepAlive = true,
    bool addRepaintBoundaries = true,
  }) : super(builder,
            childCount: childCount,
            addAutomaticKeepAlives: addAutomaticKeepAlive,
            addRepaintBoundaries: addRepaintBoundaries);

  @override
  void didFinishLayout(int firstIndex, int lastIndex) {
    // TODO: implement didFinishLayout
    super.didFinishLayout(firstIndex, lastIndex);
  }
  @override
  bool shouldRebuild(SliverChildDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return super.shouldRebuild(oldDelegate);
  }
}
