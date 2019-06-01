import 'package:flutter/material.dart';
import 'package:instagram_clone/home/home.dart';

import 'camera_page/camera_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram Exercise',
      theme: ThemeData(),
      home: MainPageView(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainPageView extends StatelessWidget {
  final controller = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PageView(
      controller: controller,
      children: <Widget>[
        CameraPage(controller: this.controller),
        MyHomePage(
          controller: this.controller,
        ),
      ],
    );
  }
}
