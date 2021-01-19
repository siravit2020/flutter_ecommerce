import 'dart:math';
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

class OrderStatus extends ConsumerWidget {
  const OrderStatus({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final w = MediaQuery.of(context).size.width;
    final w5 = MediaQuery.of(context).size.width / 5;
    final height = MediaQuery.of(context).size.height - kToolbarHeight;
    List<bool> status = [true, false, false, false, false];
    for (int i = 0; i < Random().nextInt(5); i++) {
      status[i] = true;
    }
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          appBar: StandardAppbar(
            title: "ORDER STATUS",
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
                child: Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        height: 41.h,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              stick(status[0]),
                              SizedBox(
                                height: 10.h,
                              ),
                              Container(
                                height: 64.h,
                                width: 1,
                                color: Colors.black.withOpacity(0.3),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              stick(status[1]),
                              SizedBox(
                                height: 10.h,
                              ),
                              Container(
                                height: 64.h,
                                width: 1,
                                color: Colors.black.withOpacity(0.3),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              stick(status[2]),
                              SizedBox(
                                height: 10.h,
                              ),
                              Container(
                                height: 64.h,
                                width: 1,
                                color: Colors.black.withOpacity(0.3),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              stick(status[3]),
                              SizedBox(
                                height: 10.h,
                              ),
                              Container(
                                height: 64.h,
                                width: 1,
                                color: Colors.black.withOpacity(0.3),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              stick(status[4]),
                            ],
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              orderList("Order Placed",
                                  "Your order #212423 was placed on 23th November 2019."),
                              orderList("Processing",
                                  "Your order still needs to be processed by our store before sending it to you."),
                              orderList("Picked up by the courier",
                                  "Your order has been picked up by one of our couriers and its on your way."),
                              orderList("Delivering",
                                  "The package is on your way. Make sure to be at the location to meet the courier."),
                              orderList("Delivered",
                                  "It seems like the package has arrived to you. Hope you are happy with it!"),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }

  Column orderList(String title, String subTitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 28.h,
          child: Center(
            child: Text(
              title,
              style: h20,
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        SizedBox(
          width: 250.w,
          height: 64.h,
          child: Text(
            subTitle,
            style: b14.copyWith(color: Colors.black),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
      ],
    );
  }

  Column stick(bool status) {
    return Column(
      children: [
        Container(
          width: 28.h,
          height: 28.h,
          decoration: (status)
              ? BoxDecoration(
                  color: brownGoldColor,
                  shape: BoxShape.circle,
                )
              : BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black.withOpacity(0.3))),
          child: Center(
            child: SvgPicture.asset(
              'assets/icons/correct.svg',
              width: 7,
              height: 7,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
