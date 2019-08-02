import 'dart:io';

import 'package:flutter/material.dart';
import 'package:better_socket/better_socket.dart';

class WebSocketRoute extends StatefulWidget {
  @override
  _WebSocketRouteState createState() => new _WebSocketRouteState();
}

class _WebSocketRouteState extends State<WebSocketRoute> {
  TextEditingController _controller = new TextEditingController();
  // IOWebSocketChannel channel;
  String _text = "";

  @override
  void initState() {
    //创建websocket连接
    // channel =
    //     new IOWebSocketChannel.connect('ws://139.199.153.108:5152/websocket');
    BetterSocket.connentSocket("ws://123.207.167.163:9010/ajaxchattest");
    BetterSocket.addListener(onOpen: (httpStatus, httpStatusMessage) {
      print(
          "onOpen---httpStatus:$httpStatus  httpStatusMessage:$httpStatusMessage");
    }, onMessage: (message) {
      setState(() {
        _text = message;
      });
      print("onMessage---message:$message");
    }, onClose: (code, reason, remote) {
      print("onClose---code:$code  reason:$reason  remote:$remote");
    }, onError: (message) {
      print("onError---message:$message");
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("WebSocket(内容回显)"),
      ),
      body: new Padding(
        padding: const EdgeInsets.all(20.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Form(
              child: new TextFormField(
                controller: _controller,
                decoration: new InputDecoration(labelText: 'Send a message'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: new Text(_text),
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _sendMessage,
        tooltip: 'Send message',
        child: new Icon(Icons.send),
      ),
    );
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      // channel.sink.add(_controller.text);
      BetterSocket.sendMsg(_controller.text);
    }
  }

  @override
  void dispose() {
    // channel.sink.close();
    BetterSocket.close();
    super.dispose();
  }
}
