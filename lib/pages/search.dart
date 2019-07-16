import 'package:flutter/material.dart';

const searchList = [
  "jiejie-大长腿",
  "jiejie-小蛮腰",
  "gege-欧巴",
  "gege-穷"
];

const defList = [
  "推荐1",
  "推荐2"
];

class SearchBar extends StatefulWidget {
  SearchBar({Key key}) : super(key: key);

  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('搜索demo'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              showSearch(context: context,delegate: SearchBarDelegate());
            },
          )
        ],
      ),
      body: Container(),
    );
  }
}

class SearchBarDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: (){
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,progress: transitionAnimation,
      ),
      onPressed: (){
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      child: Card(
        color: Colors.blueAccent,
        child: Center(
          child: Text(query),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestList = query.isEmpty ? defList : searchList.where((input)=>input.startsWith(query)).toList();
    return ListView.builder(
      itemCount: suggestList.length,
      itemBuilder: (context,index) => ListTile(
        title: RichText(
          text: TextSpan(
            text: suggestList[index].substring(0,query.length),
            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                text: suggestList[index].substring(query.length),
                style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w300)
              )
            ]
          ),
        ),
      ),
    );
  }
}