import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/utils.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.controller}) : super(key: key);

  final PageController controller;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  BottomNavigationBarItem bottomButtonItem(String image) {
    return BottomNavigationBarItem(
      icon: Image.asset(
        image,
        height: 25,
      ),
      title: Container(
        height: 0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          bottomButtonItem("home.png"),
          bottomButtonItem("search.png"),
          bottomButtonItem("plus.png"),
          bottomButtonItem("heart.png"),
          BottomNavigationBarItem(
            icon: Utils.getProfileImage(height: 25.0),
            title: Container(
              height: 0,
            ),
          ),
        ],
      ),
      appBar: AppBar(
        elevation: 2.0,
        backgroundColor: Color(0xFFFAFAFA),
        title: Padding(
          padding: const EdgeInsets.only(top: 16.0, bottom: 10.0),
          child: Image.asset("InstagramLogo.png"),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(16),
            child: Image.asset("direct.png"),
          ),
        ],
        leading: GestureDetector(
          onTap: () {
            widget.controller.animateToPage(
              0,
              duration: Duration(milliseconds: 500),
              curve: Curves.ease,
            );
          },
          child: Padding(
            padding: EdgeInsets.all(14),
            child: Image.asset("camera.png"),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1.0,
                    color: Color(0xFFF0F0F0),
                  ),
                ),
              ),
              child: StoriesListView(),
            ),
          ),
          MainHomeList()
        ],
      ),
    );
  }
}

class MainHomeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Container(
            padding: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color(0xFFF0F0F0),
                ),
              ),
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 15),
                  child: Row(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        child: Image.network(
                          Utils.image(),
                          height: 33,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          "This is your friend!",
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      Image.asset(
                        "more.png",
                        fit: BoxFit.contain,
                        height: 15,
                      ),
                    ],
                  ),
                ),
                Image.network(
                  Utils.image(isBig: true),
                  fit: BoxFit.cover,
                  height: 350,
                  width: double.infinity,
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          top: 15, left: 15, right: 20, bottom: 10),
                      child: Row(
                        children: <Widget>[
                          Image.asset(
                            "heart.png",
                            height: 27,
                          ),
                          SizedBox(
                            width: 13,
                          ),
                          Image.asset(
                            "comment.png",
                            height: 27,
                          ),
                          SizedBox(
                            width: 13,
                          ),
                          Image.asset(
                            "direct.png",
                            width: 27,
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Image.asset(
                                "save.png",
                                height: 27,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text(
                                "1.000 likes",
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 7),
                              child: RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: "Gabriele Cicconetti ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          "Hi everyone thank you for watching :))",
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 15),
                              child: Text(
                                "See other 25 comments",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Utils.getProfileImage(),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                "Add a comment...",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text(
                                "17 minutes ago",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        childCount: 100,
      ),
    );
  }
}

class StoriesListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                          child: Image.network(
                            Utils.image(forProfile: index == 0),
                            fit: BoxFit.cover,
                          ),
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
