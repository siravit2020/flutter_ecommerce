import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecommerce/color_plate.dart';
import 'package:flutter_ecommerce/global_widgets/global_widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderStatus extends ConsumerWidget {
  const OrderStatus({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final w = MediaQuery.of(context).size.width;
    final w5 = MediaQuery.of(context).size.width / 5;
    final height = MediaQuery.of(context).size.height - kToolbarHeight;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            centerTitle: true,
            leading: IconButton(
              splashRadius: 20,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: SvgPicture.asset(
                'assets/icons/backArrow.svg',
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.black,
            title: Text(
              "ORDER STATUS",
              style: TextStyle(
                  fontSize: 13, fontFamily: 'avenirB', color: Colors.white),
            ),
          ),
          body: Container(
            width: double.infinity,
            constraints: new BoxConstraints(
              minHeight: height,
            ),
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(20.0),
                topRight: const Radius.circular(20.0),
              ),
            ),
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
                        height: 40,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              stick(true),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 64,
                                width: 1,
                                color: Colors.black.withOpacity(0.3),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              stick(false),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 64,
                                width: 1,
                                color: Colors.black.withOpacity(0.3),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              stick(false),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 64,
                                width: 1,
                                color: Colors.black.withOpacity(0.3),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              stick(false),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 64,
                                width: 1,
                                color: Colors.black.withOpacity(0.3),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              stick(false),
                            ],
                          ),
                          SizedBox(
                            width: 20,
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
          height: 28,
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'avenirH',
                color: Colors.black,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 250,
          height: 64,
          child: Text(
            subTitle,
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'avenirB',
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Column stick(bool status) {
    return Column(
      children: [
        Container(
          width: 28,
          height: 28,
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
