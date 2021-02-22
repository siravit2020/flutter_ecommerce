import 'dart:math';
import 'dart:ui';
import 'package:flutter/widgets.dart';
import 'package:flutter_ecommerce/constants.dart';
import 'package:flutter_ecommerce/global_widgets/global_widgets.dart';
import 'package:flutter_ecommerce/main_screen/widgets/star.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecommerce/color_plate.dart';
import 'package:flutter_ecommerce/more_detail2.dart';

import 'package:flutter_ecommerce/text_style.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail(this.tag, {Key key}) : super(key: key);
  final String tag;

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  double position = 0;
  bool show = true;
  bool end = false;
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final w5 = MediaQuery.of(context).size.width / 5;
    final height = MediaQuery.of(context).size.height - kToolbarHeight;
    final Collections item = allItem[int.parse(widget.tag)];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          splashRadius: 20,
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/icons/backArrow.svg',
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        title: Text(
          "PRODUCT DETAILS",
          style: b13,
        ),
      ),
      body: Stack(
        children: [
          NotificationListener<ScrollNotification>(
            onNotification: (scrollNotification) {
              if (scrollNotification is ScrollStartNotification) {
                //  print('start ${scrollNotification.metrics}');
                if (scrollNotification.metrics.pixels == 0)
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    print("true");

                    setState(() {
                      show = false;
                    });
                  });
                if (scrollNotification.metrics.pixels > 0) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                   
                    setState(() {
                      show = true;
                    });
                  });
                }
                if (scrollNotification.metrics.pixels == scrollNotification.metrics.maxScrollExtent) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    end = true;
                   
                    setState(() {
                      show = true;
                    });
                  });
                }
              } else if (scrollNotification is ScrollUpdateNotification) {
                
                

                // print('update ${scrollNotification.metrics.pixels}');
              }
              return true;
            },
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Hero(
                      tag: widget.tag,
                      child: Image(
                        image: AssetImage('assets/image/${item.image}'),
                        height: height * 0.4,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      constraints: new BoxConstraints(
                        minHeight: height / 2,
                      ),
                      decoration: new BoxDecoration(
                        color: Colors.white,
                        borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(20.0),
                          topRight: const Radius.circular(20.0),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 1.sw * 0.08),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 44.h,
                                ),
                                Text(
                                  item.name,
                                  style: h30,
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 14.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    StarRow(),
                                    SizedBox(
                                      width: 8.w,
                                    ),
                                    Text(
                                      "1.248 Reviews",
                                      style: TextStyle(color: Colors.black, fontFamily: 'avenirB', fontSize: 12),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 27.h,
                                ),
                                Text(
                                  "The Virgin Mary in the “Deesis” scene in the south\ngallery of Hagia Sophia is depicted on the Hagia\nSophia Mosaic Vase.",
                                  textAlign: TextAlign.center,
                                  style: b12,
                                ),
                                SizedBox(
                                  height: 30.h,
                                ),
                                Text(
                                  item.price,
                                  style: h30.copyWith(color: brownGoldColor),
                                ),
                                SizedBox(
                                  height: 26.h,
                                ),
                              ],
                            ),
                          ),
                          AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            height: (show && !end) ? 1.sh * 0.3 : 0,
                          ),
                          Column(
                            children: [
                              MoreDetails2(),
                              Text(
                                "Similar products",
                                style: TextStyle(color: Colors.black, fontFamily: 'avenirH', fontSize: 24),
                              ),
                              SizedBox(
                                height: 27.h,
                              ),
                              rowItem(featured2),
                            ],
                          ),
                          SizedBox(
                            height: 80.h,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            curve: Curves.easeIn,
            duration: Duration(milliseconds: 300),
            bottom: show ? 16.5.h : -kToolbarHeight,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50.h,
                  width: 50.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffF7F7F7),
                  ),
                  child: Center(
                      child: SvgPicture.asset(
                    'assets/icons/Icons-bookmark-filled.svg',
                    height: 14.h,
                    width: 14.h,
                  )),
                ),
                SizedBox(
                  width: 9.5.w,
                ),
                ButtonFill(
                  color: brownGoldColor,
                  fuction: () {
                    show = !show;
                    setState(() {});
                  },
                  message: 'ADD TO CART',
                  width: w5 * 3,
                ),
                SizedBox(
                  width: 9.5.w,
                ),
                Container(
                  height: 50.h,
                  width: 50.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffF7F7F7),
                  ),
                  child: Center(
                      child: SvgPicture.asset(
                    'assets/icons/arrow-right.svg',
                    height: 14.h,
                    width: 14.h,
                  )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

SizedBox rowItem(List<Collections> list) {
  return SizedBox(
    height: 230.h,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: list.length,
      itemBuilder: (context, index) {
        var ran = Random().nextInt(2);
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 4),
              child: Stack(
                children: [
                  Image(
                    image: AssetImage('assets/image/${list[index].image}'),
                    height: 150.h,
                  ),
                  if (ran == 0)
                    Positioned(
                      right: 0,
                      top: 10.h,
                      child: Container(
                        decoration: new BoxDecoration(
                            color: brownGoldColor,
                            borderRadius: new BorderRadius.only(
                              bottomLeft: const Radius.circular(4),
                              topRight: const Radius.circular(4),
                            )),
                        padding: EdgeInsets.all(4),
                        child: Text(
                          "-${Random().nextInt(50) + 20}%",
                          style: b12.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(
              height: 10.5.h,
            ),
            Text(
              list[index].name,
              style: b14.copyWith(color: Colors.black),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              list[index].price,
              style: m24,
              textAlign: TextAlign.center,
            ),
          ],
        );
      },
    ),
  );
}
