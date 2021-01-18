import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/color_plate.dart';
import 'package:flutter_ecommerce/global_widgets/global_widgets.dart';
import 'package:flutter_ecommerce/loading_screen/loading_page.dart';
import 'package:flutter_ecommerce/text_style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final w = 1.sw / 5;
   
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
                  height: 1.sh / 2,
                ),
                Text(
                  "€5650",
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
                  "Gülçehre ibrik \n Limited Edition",
                  style: h40.copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        ButtonFill(
          width: w * 3,
          message: "MAIN PAGE",
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
          height: 16.5.h,
        ),
      ],
    );
  }
}
