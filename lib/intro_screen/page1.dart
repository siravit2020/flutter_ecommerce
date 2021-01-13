import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/color_plate.dart';
import 'package:flutter_ecommerce/global_widgets/global_widgets.dart';
import 'package:flutter_ecommerce/loading_screen/loading_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Page1 extends StatelessWidget {
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
                Image(
                  image: AssetImage('assets/image/Gulcehre_ibrik.png'),
                  width: w * 4.8,
                ),
                Text(
                  "€5650",
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
                  "Gülçehre ibrik \n Limited Edition",
                  style: TextStyle(
                      color: Colors.white, fontSize: 40, fontFamily: 'avenirH'),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        ButtonFill(
          width: w * 3,
          message: "MASTER BUTTON",
          color: goldColor,
          fuction: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => LoadingPage(
                        nextPage: '/',
                      )),
            );
          },
        ),
        SizedBox(
          height: 16.5,
        ),
      ],
    );
  }
}
