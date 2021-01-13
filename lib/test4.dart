import 'package:flutter/material.dart';
class Test4 extends StatefulWidget {
    Test4({Key key, this.title}) : super(key: key);
    final String title;

    @override
    _Test4State createState() => new _Test4State();
}

class _Test4State extends State<Test4> {

    @override
    Widget build(BuildContext context) {
        return new Scaffold(
            appBar: new AppBar(
                title: new Text('49715760 Stackoverflow'),
            ),
            body: new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                    new Expanded(
                        child: new Material(
                            color: Colors.red,
                            child: new Text("Filled"),
                        ),
                    ),
                    new Container(
                        color: Colors.white,
                        padding: new EdgeInsets.all(10.0),
                        child: new TextField(
                            decoration: new InputDecoration(
                                hintText: 'Chat message',
                            ),
                        ),
                    ),
                ],
            ),
        );
    }
}