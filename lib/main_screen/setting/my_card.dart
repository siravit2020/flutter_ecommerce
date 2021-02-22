import 'dart:math';
import 'dart:ui';
import 'package:flutter/widgets.dart';
import 'package:flutter_ecommerce/constants.dart';
import 'package:flutter_ecommerce/global_widgets/global_widgets.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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

final listChange = ChangeNotifierProvider<ListChangeChange>((ref) {
  return ListChangeChange();
});

class ListChangeChange extends ChangeNotifier {
  List<Widget> imageSliders = cardDetail
      .map((item) => Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                gradient: LinearGradient(begin: Alignment.bottomLeft, end: Alignment.topRight, colors: [
                  const Color(0xff43444F),
                  const Color(0xff61626C),
                ]),
              ),
              child: LayoutBuilder(builder: (context, constraints) {
                return Padding(
                  padding: EdgeInsets.only(
                      top: constraints.constrainHeight() * 0.15,
                      bottom: constraints.constrainHeight() * 0.12,
                      right: constraints.constrainWidth() * 0.1,
                      left: constraints.constrainWidth() * 0.1),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset('assets/icons/card_icon2.svg'),
                          Text(
                            "${item.month} / ${item.year}",
                            style: b12.copyWith(color: Colors.white),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Text(
                        item.cardNumber,
                        style: h24.copyWith(color: Colors.white),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        "Card Holder",
                        style: b12.copyWith(color: Colors.white.withOpacity(0.5)),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            item.cardHolderName,
                            style: h20.copyWith(color: Colors.white),
                          ),
                          SvgPicture.asset('assets/icons/card_icon.svg'),
                        ],
                      ),
                    ],
                  ),
                );
              }),
            ),
          ))
      .toList();

  void remove(int index) {
    imageSliders.removeAt(index);
    notifyListeners();
  }
}

final controller = CarouselController;

class MyCard extends StatelessWidget {
  const MyCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              child: Consumer(builder: (context, watch, child) {
                final _index = watch(indexState);
                final list = watch(listChange);
                return IconButton(
                  splashRadius: 20,
                  color: Colors.white,
                  onPressed: () {
                    list.remove(_index.state);
                  },
                  icon: SvgPicture.asset(
                    'assets/icons/trashOut.svg',
                    width: 18,
                    height: 18,
                    color: Colors.white,
                  ),
                );
              }),
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
                Consumer(builder: (context, watch, child) {
                  final _index = watch(indexState);
                  final list = watch(listChange);
                  return Column(
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(
                            enableInfiniteScroll: false,
                            initialPage: 0,
                            enlargeCenterPage: true,
                            onPageChanged: (index, reason) {
                              _index.state = index;
                            }),
                        items: list.imageSliders,
                      ),
                      AnimatedSmoothIndicator(
                        activeIndex: 0,
                        count: list.imageSliders.length,
                        effect: ScaleEffect(
                          dotHeight: 4,
                          dotWidth: 4,
                          spacing: 10,
                          dotColor: Color(0xff707070),
                          activeDotColor: brownGoldColor,
                          activePaintStyle: PaintingStyle.fill,
                        ),
                      ),
                    ],
                  );
                }),
                SizedBox(
                  height: 20.h,
                ),
                Consumer(
                  builder: (context, watch, child) {
                    final _index = watch(indexState);
                    final controller = watch(controllerChange);
                    controller.cardNumberController.text = cardDetail[_index.state].cardNumber;
                    controller.cardHolderlController.text = cardDetail[_index.state].cardHolderName;
                    controller.pmonthController.text = cardDetail[_index.state].month;
                    controller.yearController.text = cardDetail[_index.state].year;
                    controller.cardNumberController2.text = cardDetail[_index.state].cardHolder;
                    return Container(
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
                                cursorColor: const Color(0xffAA7E6F),
                                decoration: decoration.copyWith(
                                  labelText: 'Card Number',
                                )),
                            SizedBox(
                              height: 22,
                            ),
                            TextField(
                                controller: controller.cardHolderlController,
                                onChanged: (String msg) {},
                                cursorColor: const Color(0xffAA7E6F),
                                decoration: decoration.copyWith(
                                  labelText: 'Cardholder Name',
                                )),
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
                                            cursorColor: const Color(0xffAA7E6F),
                                            decoration: decoration.copyWith(
                                              labelText: 'Month',
                                            )),
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
                                            cursorColor: const Color(0xffAA7E6F),
                                            decoration: decoration.copyWith(
                                              labelText: 'Year',
                                            )),
                                        Positioned(
                                          bottom: 17.h,
                                          right: 10.w,
                                          child: SvgPicture.asset(
                                            'assets/icons/arrow_right.svg',
                                            width: 12.h,
                                            height: 12.h,
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
                                cursorColor: const Color(0xffAA7E6F),
                                decoration: decoration.copyWith(
                                  labelText: 'Cardholder Name',
                                )),
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
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
