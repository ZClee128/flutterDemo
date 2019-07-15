import 'package:flutter/material.dart';
import 'bottom_navigation_widget.dart';
import 'bottom_appbar_demo.dart';
void main() {
  runApp(MaterialApp(
    title: '导航栏测试',
    home: PushPage(),
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
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => new TwoView() ));
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
          leading:Container(),
          elevation: 0.0,
        ),
        body: Center(child: RaisedButton(child: Text("返回"),onPressed: (){
          Navigator.pop(context);
        },),),
      ),
    );
  }
}

class Product {
  final String title;
  final String des;
  Product(this.title,this.des);
}

class ProductList extends StatelessWidget {
  final List<Product> products;
  const ProductList({Key key,@required this.products}) : super(key: key);

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
          itemBuilder: (context,index){
            return ListTile(
              title: Text(products[index].title),
              onTap: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context)=>new ProductsDetail(product:products[index])
                  )
                );
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
  const ProductsDetail({Key key,@required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text('商品详情'),),
      body: Center(child: Text('${product.des}'),),
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
      onPressed: (){
        _navGoToFindXiaoJieJie(context);
      },
    );
  }

  _navGoToFindXiaoJieJie(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context)=>XiaoJieJie()
      )  
    );
    Scaffold.of(context).showSnackBar(SnackBar(content: Text('$result'),));
  }
}

class XiaoJieJie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('我是小姐姐'),),
      body: Center(child: Column(
        children: <Widget>[
          RaisedButton(
              child: Text('大长腿小姐姐'),
              onPressed: (){
                Navigator.pop(context,'大长腿:1511008888');
              },
            ) ,
          RaisedButton(
            child: Text('小蛮腰小姐姐'),
            onPressed: (){
              Navigator.pop(context,'小蛮腰小姐姐:1511009999');
            },
          ) ,
          Image.asset('images/real_name_man_icon.png'),
        ],
      ),),
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
      theme: ThemeData(
        primarySwatch: Colors.lightBlue
      ),
      home: FirstView(),
    );
  }
}