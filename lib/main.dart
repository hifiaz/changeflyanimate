import 'package:changeflyanimatedlogo/otherscreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Changefly Logo',
      theme: new ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: new MyHomePage(title: 'Changefly'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Set Position to Stack to make image over another image
            Stack(
              children: <Widget>[
                AnimatedOpacity(
                  // This visible will check true or false 
                  // when true play animation of opacity
                  opacity: _visible ? 1.0 : 0.0,
                  // This will efect child to bounce
                  curve: Curves.bounceOut,
                  // visible opacity will efect set by time transition
                  duration: Duration(milliseconds: 500),
                  // item of image asset
                  child: Image.asset(
                    'images/changefly-cube-top.png',
                    width: 300.0,
                  ),
                ),
                AnimatedOpacity(
                  opacity: _visible ? 1.0 : 0.0,
                  curve: Curves.bounceOut,
                  duration: Duration(milliseconds: 500),
                  child: Image.asset(
                    'images/changefly-cube-right.png',
                    width: 300.0,
                  ),
                ),
                AnimatedOpacity(
                  opacity: _visible ? 1.0 : 0.0,
                  curve: Curves.bounceOut,
                  duration: Duration(milliseconds: 500),
                  child: Image.asset(
                    'images/changefly-cube-left.png',
                    width: 300.0,
                  ),
                ),
              ],
            ),
            // Set to make distance between image and button
            Padding(
              padding: const EdgeInsets.all(20.0),
            ),
            // Button for next screen
            RaisedButton(
              onPressed: () {
                // when raise button click screen will change to other screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OtherScreen()),
                );
              },
              child: Text('Next'),
              color: Colors.orange,
              // Button rounded / border radius
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // when button in click
          // visible will be false and animation will play it
          setState(() {
            _visible = !_visible;
          });
        },
        tooltip: 'Toggle Opacity',
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
