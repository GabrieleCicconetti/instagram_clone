import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/utils.dart';

class CameraPage extends StatefulWidget {
  CameraPage({Key key, this.controller}) : super(key: key);

  final PageController controller;
  final double iconHeight = 30;
  final PageController bottomPageController =
      PageController(viewportFraction: .2);

  @override
  CameraPageState createState() => CameraPageState();
}

class CameraPageState extends State<CameraPage> {
  CameraController _controller;
  Future<void> _controllerInizializer;
  double cameraHorizontalPosition = 0;

  Future<CameraDescription> getCamera() async {
    final c = await availableCameras();
    return c.first;
  }

  @override
  void initState() {
    super.initState();

    getCamera().then((camera) {
      if (camera == null) return;
      setState(() {
        _controller = CameraController(
          camera,
          ResolutionPreset.high,
        );
        _controllerInizializer = _controller.initialize();
        _controllerInizializer.whenComplete(() {
          setState(() {
            cameraHorizontalPosition = -(MediaQuery.of(context).size.width*_controller.value.aspectRatio)/2;
          });
        });
      });
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Positioned.fill(
          /* trying to preserve aspect ratio */
          left: cameraHorizontalPosition,
          right: cameraHorizontalPosition,
          child: FutureBuilder(
            future: _controllerInizializer,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return CameraPreview(_controller);
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
        Positioned.fill(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              leading: Icon(Icons.settings),
              actions: <Widget>[
                GestureDetector(
                  onTap: () {
                    widget.controller.animateToPage(
                      1,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  },
                  child: Icon(Icons.arrow_forward),
                ),
              ],
            ),
            body: Container(
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Positioned(
                    bottom: 50,
                    right: 40,
                    left: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          height: widget.iconHeight,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          child: ClipRRect(
                            child: Image.network(
                              Utils.image(),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                        ),
                        Container(
                          height: widget.iconHeight,
                          child: Icon(
                            Icons.flash_on,
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                            ),
                          ),
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(35),
                            ),
                            border: Border.all(
                              width: 10,
                              color: Colors.white.withOpacity(.5),
                            ),
                          ),
                        ),
                        Container(
                          height: widget.iconHeight,
                          child: Icon(
                            Icons.cached,
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          height: widget.iconHeight,
                          child: Icon(
                            Icons.tag_faces,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 0,
                    left: 0,
                    bottom: 10,
                    height: 20,
                    child: PageView.builder(
                      controller: widget.bottomPageController,
                      itemBuilder: (context, index) {
                        return Text(
                          "Item $index",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        );
                      },
                      itemCount: 20,
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    width: 10,
                    height: 10,
                    child: Icon(
                      Icons.arrow_drop_up,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
