import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecommerce/color_plate.dart';
import 'package:flutter_ecommerce/country_data.dart';
import 'package:flutter_ecommerce/global_widgets/global_widgets.dart';
import 'package:flutter_ecommerce/select_country.dart';
import 'package:flutter_ecommerce/text_style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final controllerState = StateProvider<PageController>((ref) {
  return PageController(initialPage: 0);
});
final countryState = StateProvider<List<CountryData>>((ref) {
  return null;
});
Future<List<CountryData>> getJson() async {
  var res = await rootBundle.loadString('assets/data.json');
  return countryDataFromJson(res);
}

class NewAddress extends ConsumerWidget {
  const NewAddress({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final w = MediaQuery.of(context).size.width;
    final w5 = MediaQuery.of(context).size.width / 5;
    final height = MediaQuery.of(context).size.height - kToolbarHeight;
    final controller = watch(controllerState);
    final country = watch(countryState);
    getJson().then((value) {
       country.state  = value;
    });
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          appBar: StandardAppbar(
            title: "NEW ADDRESS",
          ),
          body: Container(
            width: double.infinity,
            constraints: new BoxConstraints(
              minHeight: height,
            ),
            decoration: whiteCorner,
            child: PageView(
              //physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              controller: controller.state,
              children: [
                Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: w * 0.08),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                SizedBox(
                                  height: 40.h,
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
                                    contentPadding: EdgeInsets.only(left: 10.w),
                                    labelText: 'Address Line1',
                                    labelStyle: b16,
                                  ),
                                ),
                                SizedBox(
                                  height: 30.h,
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
                                    contentPadding: EdgeInsets.only(left: 10.w),
                                    labelText: 'Address Line2',
                                    labelStyle: b16,
                                  ),
                                ),
                                SizedBox(
                                  height: 30.h,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    print("click${Random().nextInt(10)}");
                                    controller.state.nextPage(
                                      curve: Curves.easeOutCirc,
                                      duration: new Duration(milliseconds: 500),
                                    );
                                  },
                                  child: Stack(
                                    children: [
                                      Theme(
                                        data: ThemeData(
                                          disabledColor: textGrey,
                                        ),
                                        child: TextField(
                                          enabled: false,
                                          onChanged: (String msg) {},
                                          cursorColor: Color(0xffAA7E6F),
                                          decoration: InputDecoration(
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color(0xffE5E5E5)),
                                            ),
                                            disabledBorder:
                                                UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color(0xffE5E5E5)),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color(0xFFCC9D76)),
                                            ),
                                            contentPadding:
                                                EdgeInsets.only(left: 10.w),
                                            labelText: 'Country',
                                            labelStyle: b16,
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
                                SizedBox(
                                  height: 30.h,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    print("click${Random().nextInt(10)}");
                                  },
                                  child: Stack(
                                    children: [
                                      Theme(
                                        data: ThemeData(
                                          disabledColor: textGrey,
                                        ),
                                        child: TextField(
                                          enabled: false,
                                          onChanged: (String msg) {},
                                          cursorColor: Color(0xffAA7E6F),
                                          decoration: InputDecoration(
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color(0xffE5E5E5)),
                                            ),
                                            disabledBorder:
                                                UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color(0xffE5E5E5)),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color(0xFFCC9D76)),
                                            ),
                                            contentPadding:
                                                EdgeInsets.only(left: 10.w),
                                            labelText: 'City',
                                            labelStyle: b16,
                                          ),
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
                                SizedBox(
                                  height: 30.h,
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
                                    contentPadding: EdgeInsets.only(left: 10.w),
                                    labelText: 'Zip Code',
                                    labelStyle: b16,
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: w * 0.08 + 10.w, right: w * 0.08 - 14.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Set Default Address",
                                  style: b16,
                                ),
                                Transform.scale(
                                  scale: 0.6,
                                  child: CupertinoSwitch(
                                    activeColor: brownGoldColor,
                                    value: true,
                                    onChanged: (bool value) {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 16.5,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: FlatButton(
                          minWidth: w5 * 3,
                          padding: EdgeInsets.fromLTRB(20, 12, 20, 12),
                          onPressed: () {},
                          color: brownGoldColor,
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22.0),
                          ),
                          child: Text(
                            "SAVE ADDRESS",
                            style: TextStyle(
                              letterSpacing: 2,
                              fontSize: 15.sp,
                              fontFamily: 'avenirM',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                TestSelect(country.state,10)
              ],
            ),
          )),
    );
  }
}
class TestSelect extends ConsumerWidget {
  const TestSelect(this.country, this.selectIndex, {Key key}) : super(key: key);
  final int selectIndex;
  final List<CountryData> country;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 27.h, bottom: 27.h),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(60))),
                height: 4,
                width: 60,
              ),
              SizedBox(
                height: 29.h,
              ),
              Text(
                "Select country",
                style: h20,
              )
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: country.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      print(index);
                    },
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                            bottom: 21.h,
                            top: 21.h,
                            right: 1.sw * 0.08,
                            left: 1.sw * 0.08),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${country[index].name}',
                              style: b14.copyWith(color: Colors.black),
                            ),
                            (index == selectIndex)
                            ?
                            SvgPicture.asset(
                              'assets/icons/correct.svg',
                              color: brownGoldColor,
                              width: 10,
                            )
                            : SizedBox()
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 1.sw * 0.08),
                    child: Divider(height: 0, thickness: 1),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
    
  }
}

