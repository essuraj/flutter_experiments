import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _height;

  @override
  initState() {
    super.initState();
    setStatusBar();
    _height = 200.0;
  }

  void setStatusBar() async {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Color(0xff2b5dfb)));
  }

  void _expand() {
    setState(() {
      _height =
          _height == 200 ? MediaQuery.of(context).size.height / 2 + 80 : 200;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      // color: CupertinoColors.black,
      child: SafeArea(
          child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                key: UniqueKey(),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xff2b5dfb), Color(0xff5581ff)])),
                // color: Colors.blue,
                padding: EdgeInsets.all(32),
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Leave Report",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Padding(padding: EdgeInsets.only(top: 40.0)),
                    new RichText(
                      text: new TextSpan(
                        style: new TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        children: <TextSpan>[
                          new TextSpan(
                              text: 'Good Morning, ',
                              style: new TextStyle(color: Colors.amber)),
                          new TextSpan(
                            text: 'Suraj',
                          ),
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    Text(
                      "View your current leave balances or request new leave",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Container(
                padding: new EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .25,
                    right: 16.0,
                    left: 16.0),
                child: AnimatedContainer(
                  height: _height,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38,
                          blurRadius: 4.0,
                        ),
                      ]),
                  // color: Colors.white,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInCubic,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Annual Leave",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                      Padding(padding: EdgeInsets.all(8)),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("Total: 25"),
                            Text("Remaining: 5")
                          ],
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(8)),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: new LinearPercentIndicator(
                          alignment: MainAxisAlignment.center,
                          width: MediaQuery.of(context).size.width / 1.4,
                          lineHeight: 10.0,
                          percent: 0.7,
                          progressColor: Colors.blue,
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FloatingActionButton(
                              onPressed: this._expand,
                              backgroundColor: Colors.white,
                              child: Icon(
                                _height == 200
                                    ? Icons.keyboard_arrow_down
                                    : Icons.keyboard_arrow_up,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Expanded(
                            flex: 1,
                            child: ListView(
                              shrinkWrap: true,
                              children: <Widget>[
                                ListTile(
                                  leading: Icon(Icons.map),
                                  title: Text(
                                    'Annual Leave',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text('Feb 12 - Feb 19'),
                                ),
                                ListTile(
                                  leading: Icon(Icons.photo_album),
                                  title: Text(
                                    'Study Leave',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text('Mar 1 - Mar 5'),
                                ),
                                ListTile(
                                  leading: Icon(Icons.access_time),
                                  title: Text(
                                    'Home Leave',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text('Mar 14 - Mar 25'),
                                ),
                              ],
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(28),
          ),
          Container(
            child: RaisedButton(
              color: Colors.blue[900],
              textColor: Colors.white,
              child: Text("REQUEST LEAVE"),
              onPressed: () {},
            ),
          ),
        ],
      )),
    );
  }
}
