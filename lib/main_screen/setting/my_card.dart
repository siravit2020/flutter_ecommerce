import 'dart:math';
import 'dart:ui';
import 'package:flutter/widgets.dart';
import 'package:flutter_ecommerce/constants.dart';
import 'package:flutter_ecommerce/global_widgets/global_widgets.dart';
import 'package:flutter_ecommerce/main_screen/widgets/star.dart';
import 'package:flutter_ecommerce/more_detail.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecommerce/color_plate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

final indexState = StateProvider<int>((ref) {
  return 0;
});
final List<String> imgList = [
  'MasterCard.png',
  'MasterCard2.png',
];
final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              child: Image(
                image: AssetImage(
                  'assets/image/$item',
                ),
              ),
            ),
          ),
        ))
    .toList();
final controller = CarouselController;

class MyCard extends ConsumerWidget {
  const MyCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final w = MediaQuery.of(context).size.width;
    final w5 = MediaQuery.of(context).size.width / 5;
    final height = MediaQuery.of(context).size.height - kToolbarHeight;
    final _index = watch(indexState);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          splashRadius: 20,
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/icons/backArrow.svg',
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
        title: Text(
          "MY CARD",
          style: TextStyle(
            fontSize: 13,
            fontFamily: 'avenirB',
            color: Colors.white,
            letterSpacing: 1.5,
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
               
                  Container(
                    child: Column(
                      children: <Widget>[
                        CarouselSlider(
                          options: CarouselOptions(
                              enableInfiniteScroll: false,
                              initialPage: 0,
                              aspectRatio: 315 / 190,
                              enlargeCenterPage: true,
                              onPageChanged: (index, reason) {
                                _index.state = index;
                              }),
                          items: imageSliders,
                        ),
                      ],
                    ),
                  ),
              
                  AnimatedSmoothIndicator(
                    activeIndex: _index.state,
                    count: 2,
                    effect: ScaleEffect(
                      dotHeight: 4,
                      dotWidth: 4,
                      spacing: 10,
                      dotColor: Color(0xff707070),
                      activeDotColor: brownGoldColor,
                      activePaintStyle: PaintingStyle.fill,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    constraints: new BoxConstraints(
                      minHeight: height * 0.6,
                    ),
                    decoration: new BoxDecoration(
                      color: Colors.white,
                      borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(20.0),
                        topRight: const Radius.circular(20.0),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: w * 0.08),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SizedBox(
                            height: 44,
                          ),
                          TextField(
                            onChanged: (String msg) {},
                            cursorColor: Color(0xffAA7E6F),
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xffE5E5E5)),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFFCC9D76)),
                              ),
                              contentPadding: EdgeInsets.only(left: 10),
                              labelText: 'Card Number',
                              labelStyle: TextStyle(
                                fontSize: 16,
                                fontFamily: 'avenirB',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 22,
                          ),
                          TextField(
                            onChanged: (String msg) {},
                            cursorColor: Color(0xffAA7E6F),
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xffE5E5E5)),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFFCC9D76)),
                              ),
                              contentPadding: EdgeInsets.only(left: 10),
                              labelText: 'Cardholder Namee',
                              labelStyle: TextStyle(
                                fontSize: 16,
                                fontFamily: 'avenirB',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 22,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    print("click${Random().nextInt(10)}");
                                  },
                                  child: Stack(
                                    children: [
                                      TextField(
                                        enabled: false,
                                        onChanged: (String msg) {},
                                        cursorColor: Color(0xffAA7E6F),
                                        decoration: InputDecoration(
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xffE5E5E5)),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xFFCC9D76)),
                                          ),
                                          contentPadding:
                                              EdgeInsets.only(left: 10),
                                          labelText: 'Month',
                                          labelStyle: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'avenirB',
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 17,
                                        right: 10,
                                        child: SvgPicture.asset(
                                          'assets/icons/arrow_right.svg',
                                          width: 12,
                                          height: 12,
                                          color: Colors.black,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    print("click${Random().nextInt(10)}");
                                  },
                                  child: Stack(
                                    children: [
                                      TextField(
                                        enabled: false,
                                        onChanged: (String msg) {},
                                        cursorColor: Color(0xffAA7E6F),
                                        decoration: InputDecoration(
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xffE5E5E5)),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xFFCC9D76)),
                                          ),
                                          contentPadding:
                                              EdgeInsets.only(left: 10),
                                          labelText: 'Year',
                                          labelStyle: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'avenirB',
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 17,
                                        right: 10,
                                        child: SvgPicture.asset(
                                          'assets/icons/arrow_right.svg',
                                          width: 12,
                                          height: 12,
                                          color: Colors.black,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 22,
                          ),
                          TextField(
                            onChanged: (String msg) {},
                            cursorColor: Color(0xffAA7E6F),
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xffE5E5E5)),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFFCC9D76)),
                              ),
                              contentPadding: EdgeInsets.only(left: 10),
                              labelText: 'Cardholder Name',
                              labelStyle: TextStyle(
                                fontSize: 16,
                                fontFamily: 'avenirB',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            right: 0,
            left: 0,
            child: Center(
              child: ButtonFill(
                message: "ADD NEW CARD",
                color: brownGoldColor,
                fuction: () {},
                width: w5 * 3,
              ),
            ),
          )
        ],
      ),
    );
  }
}
