import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/color_plate.dart';
import 'package:flutter_ecommerce/global_widgets/global_widgets.dart';
import 'package:flutter_ecommerce/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Page2 extends StatelessWidget {
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
                Text(
                  "HISTORY CULTRUE GLASS",
                  style: b13.copyWith(color: Colors.white),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "Hagia Sophia \n Deesis Mosaic Vase",
                  style: h40.copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 9.5.h,
                ),
                Text(
                  "€3450",
                  style: h20.copyWith(color: Colors.white),
                ),
                Image(
                  image: AssetImage('assets/image/SoteriaVazo.png'),
                  height: 1.sh / 2,
                ),
              ],
            ),
          ),
        ),
        ButtonFill(
          width: w * 3,
          color: goldColor,
          message: "MAIN PAGE",
          fuction: () {
            Navigator.pushNamed(context, '/main');
          },
        ),
        SizedBox(
          height: 16.5.h,
        ),
      ],
    );
  }
}
