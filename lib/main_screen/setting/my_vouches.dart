import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecommerce/color_plate.dart';
import 'package:flutter_ecommerce/global_widgets/global_widgets.dart';
import 'package:flutter_ecommerce/text_style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyVouches extends ConsumerWidget {
  const MyVouches({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final w = MediaQuery.of(context).size.width;
    final w5 = MediaQuery.of(context).size.width / 5;
    final height = MediaQuery.of(context).size.height - kToolbarHeight;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          appBar: StandardAppbar(
            title: "MY VOUCHES",
          ),
          body: Container(
            width: double.infinity,
            constraints: new BoxConstraints(
              minHeight: height,
            ),
            decoration: whiteCorner,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: w * 0.08),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      height: 41.h,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "ACTIVE VOUCHERS",
                        style: b14,
                      ),
                    ),
                    SizedBox(
                      height: 22.h,
                    ),
                    ticket("Boutique Discount", "Valid until February 2020", 20,
                        0),
                    SizedBox(
                      height: 16.h,
                    ),
                    ticket("Traditional Special",
                        "Valid until 14th February 2020", 14, 0),
                    SizedBox(
                      height: 16.h,
                    ),
                    ticket("Christmas Special", "Valid until February 2020", 30,
                        0),
                    SizedBox(
                      height: 41.h,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "USED VOUCHERS",
                        style: b14,
                      ),
                    ),
                    SizedBox(
                      height: 22.h,
                    ),
                    ticket("2 for 1", "Used on 24th December 2019", 20, 0.5),
                    SizedBox(
                      height: 22.h,
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }

  LayoutBuilder ticket(
      String title, String subTitle, int percent, double opacity) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        foregroundDecoration: BoxDecoration(
          color: Colors.white.withOpacity(opacity),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Row(
          children: [
            Container(
              width: constraints.constrainWidth() * 0.67,
              height: 100.h,
              decoration: BoxDecoration(
                color: Color(0xffF7F7F7),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 24.w, right: 4.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: h20,
                    ),
                    Text(
                      subTitle,
                      style: b14,
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: constraints.constrainWidth()*0.03,
              height: 100.h,
              color: Color(0xffF7F7F7),
              child: Column(
                children: [
                  SizedBox(
                    height: 4.h,
                    width: 10.w,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Expanded(
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return Flex(
                          children: List.generate(
                            (constraints.constrainHeight() / 8).floor(),
                            (index) => SizedBox(
                              height: 4.h,
                              width: 1.w,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.2)),
                              ),
                            ),
                          ),
                          direction: Axis.vertical,
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  SizedBox(
                    height: 4.h,
                    width: 10.w,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: constraints.constrainWidth()*0.30,
              height: 100.h,
              decoration: BoxDecoration(
                color: Color(0xffF7F7F7),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
              child: Center(
                child: Text(
                  "$percent%",
                  style: h30.copyWith(color: brownGoldColor),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
