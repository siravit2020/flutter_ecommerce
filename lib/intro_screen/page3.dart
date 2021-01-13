import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/color_plate.dart';
import 'package:flutter_ecommerce/global_widgets/global_widgets.dart';

class Page3 extends StatelessWidget {
  const Page3({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width / 5;
    return Column(
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //SvgPicture.asset("assets/image/Gulcehre_ibrik.svg",width: 100,height: 100,),
                Image(
                  image: AssetImage('assets/image/MysticalVase.png'),
                  width: w * 4.8,
                ),
                Text(
                  "€3150",
                  style: TextStyle(
                      color: Colors.white, fontSize: 20, fontFamily: 'avenirH'),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "HISTORY CULTRUE GLASS",
                  style: TextStyle(
                      color: Colors.white, fontSize: 13, fontFamily: 'avenirB'),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Mystical Vase \n Limited Edition",
                  style: TextStyle(
                      color: Colors.white, fontSize: 40, fontFamily: 'avenirH'),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 24,
        ),
        FlatButton(
          minWidth: w * 3,
          padding: EdgeInsets.fromLTRB(45, 12, 45, 12),
          onPressed: () {
             Navigator.pushNamed(context, '/login');
          },
          textColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22.0),
              side: BorderSide(color: Colors.white)),
          child: Text(
            "SIGN IN",
            style: TextStyle(fontSize: 15, fontFamily: 'avenirM'),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        ButtonFill(
          width: w * 3,
          color: goldColor,
          message: "CREATIVE ACCOUNT",
          fuction: () {
            Navigator.pushNamed(context, '/register');
          },
        ),
        SizedBox(
          height: 16.5,
        ),
      ],
    );
  }
} //MysticalVase.png
