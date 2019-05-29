import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool drawer = false;
  ScrollController _controller;
  @override
  void initState() {
    _controller = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      controller: _controller,
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        Container(
          width: 400,
          color: Colors.red,
          child: Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 100, 70, 0),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    drawer = !drawer;
                  });
                  drawer
                      ? _controller.animateTo(200,
                          duration: Duration(milliseconds: 200),
                          curve: Curves.easeIn)
                      : _controller.animateTo(0,
                          duration: Duration(milliseconds: 200),
                          curve: Curves.easeOut);
                },
                icon: Icon(Icons.menu),
              ),
            ),
          ),
        ),
        Container(
          width: 200,
          color: Colors.black,
        )
      ],
    ));
  }
}
