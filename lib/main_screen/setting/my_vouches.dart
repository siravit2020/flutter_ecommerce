import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecommerce/color_plate.dart';
import 'package:flutter_ecommerce/global_widgets/global_widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
              "MY VOUCHES",
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "ACTIVE VOUCHERS",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'avenirB',
                          color: textGrey,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    ticket("Boutique Discount", "Valid until February 2020", 20,
                        0),
                    SizedBox(
                      height: 16,
                    ),
                    ticket("Traditional Special",
                        "Valid until 14th February 2020", 14, 0),
                    SizedBox(
                      height: 16,
                    ),
                    ticket("Christmas Special", "Valid until February 2020", 30,
                        0),
                    SizedBox(
                      height: 40,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "USED VOUCHERS",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'avenirB',
                          color: textGrey,
                        ),
                      ),
                    ),
                     SizedBox(
                      height: 22,
                    ),
                    ticket("2 for 1", "Used on 24th December 2019", 20,
                        0.5),
                    SizedBox(
                      height: 22,
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }

  Container ticket(String title, String subTitle, int percent, double opacity) {
    return Container(
      foregroundDecoration: BoxDecoration(
        color: Colors.white.withOpacity(opacity),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Row(
        children: [
          Container(
            width: 220,
            height: 100,
            decoration: BoxDecoration(
              color: Color(0xffF7F7F7),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 24,right: 4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'avenirH',
                    ),
                  ),
                  Text(
                    subTitle,
                    style: TextStyle(
                      color: textGrey,
                      fontSize: 14,
                      fontFamily: 'avenirB',
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            width: 10,
            height: 100,
            color: Color(0xffF7F7F7),
            child: Column(
              children: [
                SizedBox(
                  height: 4,
                  width: 10,
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
                  height: 6,
                ),
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Flex(
                        children: List.generate(
                          (constraints.constrainHeight() / 8).floor(),
                          (index) => SizedBox(
                            height: 4,
                            width: 1,
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
                  height: 6,
                ),
                SizedBox(
                  height: 4,
                  width: 10,
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
            width: 90,
            height: 100,
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
                style: TextStyle(
                  color: brownGoldColor,
                  fontSize: 30,
                  fontFamily: 'avenirH',
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
