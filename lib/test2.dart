import 'package:flutter/material.dart';

class FormFieldSample extends StatefulWidget {
  FormFieldSample({Key key}) : super(key: key);

  @override
  _FormFieldSampleState createState() => _FormFieldSampleState();
}

class _FormFieldSampleState extends State<FormFieldSample> {
  // Initially password is obscure
  bool _obscureText = true;

  String _password;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Sample"),
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new TextFormField(
              decoration: const InputDecoration(
                  labelText: 'Password',
                  icon: const Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: const Icon(Icons.lock))),
              validator: (val) => val.length < 6 ? 'Password too short.' : null,
              onSaved: (val) => _password = val,
              obscureText: _obscureText,
            ),
            FlatButton(
              onPressed: _toggle,
              child: new Text(_obscureText ? "Show" : "Hide"),
            ),
            InkWell(
                            child: GestureDetector(
                              onTap: (){},
                              child: Text("Forgot password?")),
                          )
          ],
        ),
      ),
    );
  }
}
