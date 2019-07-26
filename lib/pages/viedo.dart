import 'package:flt_video_player/flt_video_player.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;

class Video extends StatefulWidget {
  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    // https://github.com/RandyWei/flt_video_player/blob/master/example/SampleVideo_1280x720_30mb.mp4?raw=true
    // http://vfx.mtime.cn/Video/2019/02/04/mp4/190204084208765161.mp4
    // _controller = VideoPlayerController.path(
    //     "https://look.chinahrt.com.cn//courseyun/rx/topic/video/170508/149421376907147ae58ea-09f2-4b7c-a22c-11567a5ae96b.mp4")
    //   ..initialize();
    MyWebsocket();
  }

  void MyWebsocket() async {
    var channel =  IOWebSocketChannel.connect(
        "ws://123.207.167.163:9010/ajaxchattest");

    channel.stream.listen((message) {
      channel.sink.add("received!");
      channel.sink.close(status.goingAway);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Simple Demo",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Simple Demo"),
        ),
        // body: AspectRatio(
        //   aspectRatio: 1.8,
        //   child: VideoPlayer(_controller),
        // ),
        body: Center(),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }
}
