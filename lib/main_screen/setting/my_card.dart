import 'dart:math';
import 'dart:ui';
import 'package:flutter/widgets.dart';
import 'package:flutter_ecommerce/constants.dart';
import 'package:flutter_ecommerce/global_widgets/global_widgets.dart';
import 'package:flutter_ecommerce/main_screen/widgets/star.dart';
import 'package:flutter_ecommerce/more_detail.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecommerce/color_plate.dart';
import 'package:flutter_ecommerce/text_style.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final indexState = StateProvider<int>((ref) {
  return 0;
});
final controllerChange = ChangeNotifierProvider<ControllerChange>((ref) {
  return ControllerChange();
});

class ControllerChange extends ChangeNotifier {
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController cardHolderlController = TextEditingController();
  TextEditingController pmonthController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController cardNumberController2 = TextEditingController();
}

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
    final controller = watch(controllerChange);
    controller.cardNumberController.text = cardDetail[_index.state].cardNumber;
    controller.cardHolderlController.text =
        cardDetail[_index.state].cardHolderName;
    controller.pmonthController.text = cardDetail[_index.state].month;
    controller.yearController.text = cardDetail[_index.state].year;
    controller.cardNumberController2.text = cardDetail[_index.state].cardHolder;
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
            "MY CARDa",
            style: TextStyle(
              fontSize: 13.sp,
              fontFamily: 'avenirB',
              color: Colors.white,
              letterSpacing: 1.5,
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 4.w),
              child: IconButton(
                splashRadius: 20,
                color: Colors.white,
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/icons/trashOut.svg',
                  width: 18,
                  height: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                      enableInfiniteScroll: false,
                      initialPage: 0,
                      aspectRatio: 315.w / 190.h,
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) {
                        _index.state = index;
                      }),
                  items: imageSliders,
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
                  height: 20.h,
                ),
                Container(
                  width: double.infinity,
                  constraints: new BoxConstraints(
                    minHeight: height * 0.6,
                  ),
                  decoration: whiteCorner,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * 0.08),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          height: 44.h,
                        ),
                        TextField(
                          controller: controller.cardNumberController,
                          onChanged: (String msg) {},
                          cursorColor: Color(0xffAA7E6F),
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffE5E5E5)),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFCC9D76)),
                            ),
                            contentPadding: EdgeInsets.only(left: 10),
                            labelText: 'Card Number',
                            labelStyle: b16,
                          ),
                        ),
                        SizedBox(
                          height: 22,
                        ),
                        TextField(
                          controller: controller.cardHolderlController,
                          onChanged: (String msg) {},
                          cursorColor: Color(0xffAA7E6F),
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffE5E5E5)),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFCC9D76)),
                            ),
                            contentPadding: EdgeInsets.only(left: 10),
                            labelText: 'Cardholder Name',
                            labelStyle: b16,
                          ),
                        ),
                        SizedBox(
                          height: 22.h,
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
                                      controller: controller.pmonthController,
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
                                            EdgeInsets.only(left: 10.w),
                                        labelText: 'Month',
                                        labelStyle: b16,
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 17.h,
                                      right: 10.w,
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
                              width: 15.w,
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  print("click${Random().nextInt(10)}");
                                },
                                child: Stack(
                                  children: [
                                    TextField(
                                      controller: controller.yearController,
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
                                            EdgeInsets.only(left: 10.w),
                                        labelText: 'Year',
                                        labelStyle: b16,
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 17.h,
                                      right: 10.w,
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
                          height: 22.h,
                        ),
                        TextField(
                          controller: controller.cardNumberController2,
                          onChanged: (String msg) {},
                          cursorColor: Color(0xffAA7E6F),
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffE5E5E5)),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFCC9D76)),
                            ),
                            contentPadding: EdgeInsets.only(left: 10.w),
                            labelText: 'Cardholder Name',
                            labelStyle: b16,
                          ),
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        ButtonFill(
                          message: "ADD NEW CARD",
                          color: brownGoldColor,
                          fuction: () {},
                          width: w5 * 3,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
