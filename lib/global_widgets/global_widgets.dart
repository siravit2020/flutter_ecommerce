import 'package:flutter/material.dart';


class ButtonFill extends StatelessWidget {
  final double width;
  final String message;
  final Function fuction;
  final Color color;
  const ButtonFill({
    Key key,
    @required this.width,
    @required this.message,
    @required this.fuction,
    @required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      minWidth: width,
      padding: EdgeInsets.fromLTRB(20, 12, 20, 12),
      onPressed: fuction,
      color: color,
      textColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22.0),
      ),
      child: Text(
        message,
        style: TextStyle(
          letterSpacing: 1.5,
          fontSize: 15,
          fontFamily: 'avenirM',
        ),
      ),
    );
  }
}
class ButtonFill2 extends StatelessWidget {
  final double width;
  final String message;
  final Function fuction;
  final Color color;
  const ButtonFill2({
    Key key,
    @required this.width,
    @required this.message,
    @required this.fuction,
    @required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      minWidth: width,
      padding: EdgeInsets.fromLTRB(20, 12, 20, 12),
      onPressed: fuction,
      color: color,
      textColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22.0),
      ),
      child: Text(
        message,
        style: TextStyle(
          letterSpacing: 1.5,
          fontSize: 13,
          fontFamily: 'avenirM',
        ),
      ),
    );
  }
}
