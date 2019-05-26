import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram Exercise',
      theme: ThemeData(),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFAFAFA),
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 13.0),
          child: Image.asset("InstagramLogo.png"),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(16),
            child: Image.asset("direct.png"),
          )
        ],
        leading: Padding(
          padding: EdgeInsets.all(14),
          child: Image.asset("camera.png"),
        ),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Container(
              height: 120,
              child: StoriesListView(),
            ),
          )
        ],
      ),
    );
  }
}

class StoriesListView extends StatelessWidget {
  String image() {
    return "https://picsum.photos/id/${Random().nextInt(50)}/200/200";
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Positioned.fill(
                      child: index > 0
                          ? Image.asset("storyborder.png")
                          : Container(),
                    ),
                    Positioned.fill(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(
                            Radius.circular(40),
                          ),
                          child: Image.network(image(), fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    Positioned(
                      width: 23,
                      bottom: 0,
                      right: 0,
                      child: index == 0
                          ? Image.asset("plus_blue.png")
                          : Container(),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                index > 0 ? "Your best friend!!!" : "Your Story!",
                maxLines: 1,
                style: TextStyle(
                  fontSize: 12,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        );
      },
      itemExtent: 90,
      scrollDirection: Axis.horizontal,
      itemCount: 50,
    );
  }
}
