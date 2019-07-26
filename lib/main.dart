import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/pages/search.dart';
import 'package:flutter_app/pages/socket.dart';
import 'package:flutter_app/pages/warp_demo.dart';
import 'bottom_navigation_widget.dart';
import 'bottom_appbar_demo.dart';
import 'pages/custome_router.dart';
import 'pages/viedo.dart';
void main() {
  runApp(MaterialApp(
    title: '导航栏测试',
    debugShowCheckedModeBanner: false,
    home: WebSocketRoute(),
  ));
}

class FirstView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "flutter test",
      home: Scaffold(
        appBar: AppBar(
          title: Text('flutter test'),
          elevation: 0.0,
        ),
        body: Center(
          child: RaisedButton(
            child: Text('查看'),
            onPressed: () {
              Navigator.push(context, CustomeRouter(TwoView()));
            },
          ),
        ),
      ),
    );
  }
}

class TwoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '第二个页面',
      home: Scaffold(
        appBar: AppBar(
          title: Text('第二个页面'),
          leading: Container(),
          elevation: 0.0,
        ),
        backgroundColor: Colors.lightBlue,
        body: Center(
          child: RaisedButton(
            child: Text("返回"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}

class Product {
  final String title;
  final String des;
  Product(this.title, this.des);
}

class ProductList extends StatelessWidget {
  final List<Product> products;
  const ProductList({Key key, @required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '商品',
      home: Scaffold(
        appBar: AppBar(
          title: Text('商品详情'),
        ),
        body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(products[index].title),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            new ProductsDetail(product: products[index])));
              },
            );
          },
        ),
      ),
    );
  }
}

class ProductsDetail extends StatelessWidget {
  final Product product;
  const ProductsDetail({Key key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('商品详情'),
      ),
      body: Center(
        child: Text('${product.des}'),
      ),
    );
  }
}

class Test3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationWidget();
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('找小姐姐'),
      onPressed: () {
        _navGoToFindXiaoJieJie(context);
      },
    );
  }

  _navGoToFindXiaoJieJie(BuildContext context) async {
    final result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => XiaoJieJie()));
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('$result'),
    ));
  }
}

class XiaoJieJie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我是小姐姐'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('大长腿小姐姐'),
              onPressed: () {
                Navigator.pop(context, '大长腿:1511008888');
              },
            ),
            RaisedButton(
              child: Text('小蛮腰小姐姐'),
              onPressed: () {
                Navigator.pop(context, '小蛮腰小姐姐:1511009999');
              },
            ),
            Image.asset('images/real_name_man_icon.png'),
          ],
        ),
      ),
    );
  }
}

class Test4 extends StatelessWidget {
  const Test4({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'bottom_appbar_demo',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: BottomAppbarDemo(),
    );
  }
}

class PushPage extends StatelessWidget {
  const PushPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '测试转场动画',
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      home: FirstView(),
    );
  }
}

class KeepAliveDemo extends StatefulWidget {
  KeepAliveDemo({Key key}) : super(key: key);

  _KeepAliveDemoState createState() => _KeepAliveDemoState();
}

class _KeepAliveDemoState extends State<KeepAliveDemo>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  @override
  void initState() {
    _controller = TabController(length: 3, vsync: this);
    super.initState();
  }

// 重写释放
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('保持状态不变'),
        bottom: TabBar(
          controller: _controller,
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.home),
            ),
            Tab(
              icon: Icon(Icons.email),
            ),
            Tab(
              icon: Icon(Icons.directions_car),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: <Widget>[TestHomePage(), TestHomePage(), TestHomePage()],
      ),
    );
  }
}

class TestHomePage extends StatefulWidget {
  TestHomePage({Key key}) : super(key: key);

  _TestHomePageState createState() => _TestHomePageState();
}

class _TestHomePageState extends State<TestHomePage>
    with AutomaticKeepAliveClientMixin {
  int _count = 0;

  @override
  bool get wantKeepAlive => true;

  void _add() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('点击加一'),
            Text(
              '$_count',
              style: Theme.of(context).textTheme.display1,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _add,
        child: Icon(Icons.add),
      ),
    );
  }
}

class GridViewDemo extends StatefulWidget {
  GridViewDemo({Key key}) : super(key: key);

  _GridViewDemoState createState() => _GridViewDemoState();
}

class _GridViewDemoState extends State<GridViewDemo> {
  List<Widget> list = List();

  @override
  void initState() {
    for (var i = 0; i < 9; i++) {
      list..add(icons());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
          child: Wrap(
          children: list,
          spacing: 10.0,
        ),
      )
    );
  }

  Widget icons() {
    return Container(
      color: Colors.redAccent,
      width: 80.0,
      height: 80.0,
      child: Center(
        child: Text('测试'),
      ),
    );
  }
}
