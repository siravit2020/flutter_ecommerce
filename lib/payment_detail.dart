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


final controller = CarouselController;

class PaymentDetail extends ConsumerWidget {
  const PaymentDetail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final w = MediaQuery.of(context).size.width;
    final w5 = MediaQuery.of(context).size.width / 5;
    final height = MediaQuery.of(context).size.height - kToolbarHeight;
    final _index = watch(indexState);
    final controller = watch(controllerChange);
    
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
            "PATMENT DETAIL",
            style: TextStyle(
              fontSize: 13.sp,
              fontFamily: 'avenirB',
              color: Colors.white,
              letterSpacing: 1.5,
            ),
          ),
          
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 20.h,),
                Container(
                  width: 315.w,
                  height: 190.h,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                          Color(0xff43444F),
                          Color(0xff61626C),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset('assets/icons/card_icon2.svg'),
                              (controller.pmonthController.text != "" && controller.yearController.text!= "")?
                              Text(
                                
                                "${controller.pmonthController.text} / ${controller.yearController.text}",
                                style: b12.copyWith(color: Colors.white),
                              ):Text("- - / - - - -",style: b12)
                            ],
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          Text(
                            (controller.cardNumberController.text != "")?
                            controller.cardNumberController.text : "- - - -  - - - -  - - - -  - - - -",
                            style: h24.copyWith(color: Colors.white),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Text(
                            "Card Holder",
                            style: b12.copyWith(
                                color: Colors.white.withOpacity(0.5)),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                (controller.cardHolderlController.text != "")?
                                controller.cardHolderlController.text:"Your name here",
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
                SizedBox(
                  height: 40.h,
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
                            labelText: 'CCV',
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
