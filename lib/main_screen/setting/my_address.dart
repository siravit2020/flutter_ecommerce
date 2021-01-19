import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecommerce/color_plate.dart';
import 'package:flutter_ecommerce/global_widgets/global_widgets.dart';
import 'package:flutter_ecommerce/text_style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class MyAddress extends ConsumerWidget {
  const MyAddress({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final w = MediaQuery.of(context).size.width;
    final w5 = MediaQuery.of(context).size.width / 5;
    final height = MediaQuery.of(context).size.height - kToolbarHeight;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          appBar: StandardAppbar(title: "MY ADDRESS",),
          body: Container(
            width: double.infinity,
            constraints: new BoxConstraints(
              minHeight: height,
            ),
            decoration: whiteCorner,
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * 0.08),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          height: 41.h,
                        ),
                        detailsOrder("HOME ADDRESS",
                            "Dereboyu Cad. 23, \n34410 - Istanbul/Türkiye"),
                        Divider(
                          thickness: 1,
                          height: 62.h,
                        ),
                        detailsOrder("WORK ADDRESS",
                            "Dereboyu Cad. 23, \n34410 - Istanbul/Türkiye"),
                        Divider(
                          thickness: 1,
                          height: 62.h,
                        ),
                        SizedBox(
                          height: 60.h,
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 16.5.h,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: FlatButton(
                      minWidth: w5 * 3,
                      padding: EdgeInsets.fromLTRB(20, 12, 20, 12),
                      onPressed: () {
                        Navigator.pushNamed(context, '/newaddress');
                      },
                      color: brownGoldColor,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22.0),
                      ),
                      child: Text(
                        "ADD ANOTHER ADDRESS",
                        style: m13,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  Column detailsOrder(String title, String address) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: b14,
            ),
            Text(
              "Change",
              style: b14.copyWith(color: brownGoldColor),
            ),
          ],
        ),
        SizedBox(
          height: 24.h,
        ),
        Container(
          width: 200.w,
          child: Text(
            address,
            style: TextStyle(
              height: 1.4,
              fontSize: 14.sp,
              fontFamily: 'avenirB',
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
