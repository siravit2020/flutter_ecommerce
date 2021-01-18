import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/color_plate.dart';
import 'package:flutter_ecommerce/global_widgets/global_widgets.dart';
import 'package:flutter_ecommerce/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                  height: 1.sh / 2,
                ),
                Text(
                  "€3150",
                  style: h20.copyWith(color: Colors.white),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "HISTORY CULTRUE GLASS",
                  style: b13.copyWith(color: Colors.white),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "Mystical Vase \n Limited Edition",
                  style: h40.copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 24.h,
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
            style: m15,
          ),
        ),
        SizedBox(
          height: 10.h,
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
          height: 16.5.h,
        ),
      ],
    );
  }
} //MysticalVase.png
