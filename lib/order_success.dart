import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_ecommerce/color_plate.dart';
import 'package:flutter_ecommerce/global_widgets/global_widgets.dart';
import 'package:flutter_ecommerce/test5.dart';
import 'package:flutter_ecommerce/text_style.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';




class OrderSuccess extends ConsumerWidget {
  const OrderSuccess({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final w5 = MediaQuery.of(context).size.width / 5;
    final height = MediaQuery.of(context).size.height - kToolbarHeight;

    return Scaffold(
        body: Container(
      width: double.infinity,
      constraints: new BoxConstraints(
        minHeight: height,
      ),
      color: Colors.white,
      child: Stack(
        children: [
          Positioned(
            top: kToolbarHeight,
            right: 18.w,
            child: Padding(
              padding: EdgeInsets.only(top: 8.h),
              child: SvgPicture.asset('assets/icons/close.svg'),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 1.sw *0.08),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RipplesAnimation(
                        icon: 'verified.svg',
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      Text(
                        "Order placed",
                        style:h30,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Text(
                          "Your order #212423 was placed with success. You can see the status of the order at any time.",
                          style: b14,
                          textAlign: TextAlign.center),
                    ],
                  ),
                ),
             
                ButtonFill(
                  width: w5 * 3,
                  message: "SEE ORDER STATUS",
                  color: brownGoldColor,
                  fuction: () {
                    Navigator.pushNamed(context, '/orderstatus');
                  },
                ),
                ButtonFill2(
                  width: w5 * 3,
                  message: "CLOSE",
                  color: brownGoldColor.withOpacity(0.16),
                  fuction: () {
                    Navigator.pushNamedAndRemoveUntil(context, '/main',(Route<dynamic> route) => false);
                  },
                ),
                SizedBox(
                  height: 16.5.h,
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
