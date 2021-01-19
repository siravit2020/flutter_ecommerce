import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/global_widgets/global_widgets.dart';
import 'package:flutter_ecommerce/text_style.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import '../color_plate.dart';
import '../constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final sliderStart = StateProvider<double>((ref) {
  return 2000;
});
final sliderEnd = StateProvider<double>((ref) {
  return 6000;
});

final selectionsRiverpod = ChangeNotifierProvider<SelectionsState>((ref) {
  return SelectionsState();
});

class SelectionsState extends ChangeNotifier {
  List<bool> list = List.generate(selectCategories.length, (t) => false);
  List<bool> list2 = List.generate(sortWatches.length, (t) => false);

  void selectItem(int index) {
    for (int i = 0; i < list.length; i++) {
      list[i] = false;
    }
    list[index] = !list[index];
    notifyListeners();
  }

  void selectItem2(int index) {
    for (int i = 0; i < list2.length; i++) {
      list2[i] = false;
    }
    list2[index] = !list2[index];
    notifyListeners();
  }

  void clear() {
    for (int i = 0; i < list2.length; i++) {
      list2[i] = false;
    }
    for (int i = 0; i < list.length; i++) {
      list[i] = false;
    }
    notifyListeners();
  }
}

class HastagPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final w = MediaQuery.of(context).size.width;
    final w5 = MediaQuery.of(context).size.width / 5;
    final height = MediaQuery.of(context).size.height - kToolbarHeight;
    final selections = watch(selectionsRiverpod);
    final start = watch(sliderStart);
    final end = watch(sliderEnd);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 4),
              child: IconButton(
                splashRadius: 20,
                icon: SvgPicture.asset(
                  'assets/icons/close.svg',
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            )
          ],
          backgroundColor: Colors.black,
          title: Text(
            "FILTER & SORT",
            style: b13.copyWith(color: Colors.white),
          ),
        ),
        body: Container(
          width: double.infinity,
           constraints: new BoxConstraints(
            minHeight: height,
          ),
          decoration: whiteCorner,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 42,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.08),
                  child: Text(
                    "Select categories",
                    style: h20,
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(
                  height: 22.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: w * 0.08, right: w * 0.02),
                  child: Wrap(
                    children: <Widget>[
                      for (int i = 0; i < selectCategories.length; i++)
                        Padding(
                          padding: EdgeInsets.only(bottom: 5.h, right: 10.w),
                          child: FlatButton(
                            padding: EdgeInsets.only(
                                bottom: 11.h, top: 11.h, right: 15.w, left: 15.w),
                            onPressed: () {
                              print(i);
                              selections.selectItem(i);
                            },
                            splashColor: Colors.white.withOpacity(0.1),
                            color: selections.list[i]
                                ? brownGoldColor
                                : Color(0xffF7F7F7),
                            textColor:
                                selections.list[i] ? Colors.white : Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Text(
                              selectCategories[i],
                              style: TextStyle(
                                  fontSize: 14.sp, fontFamily: 'avenirB'),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.08),
                  child: Text(
                    "Sort watches by",
                    style: h20,
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(
                  height: 22.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: w * 0.08, right: w * 0.02),
                  child: Wrap(
                    children: <Widget>[
                      for (int i = 0; i < sortWatches.length; i++)
                        Padding(
                          padding: EdgeInsets.only(bottom: 5.h, right: 10.w),
                          child: FlatButton(
                            minWidth: 1,
                            padding: EdgeInsets.only(
                                bottom: 11.h, top: 11.h, right: 15.w, left: 15.w),
                            onPressed: () {
                              print(i);
                              selections.selectItem2(i);
                            },
                            splashColor: Colors.white.withOpacity(0.1),
                            color: selections.list2[i]
                                ? brownGoldColor
                                : Color(0xffF7F7F7),
                            textColor:
                                selections.list2[i] ? Colors.white : Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Text(
                              sortWatches[i],
                              style: TextStyle(
                                  fontSize: 14.sp, fontFamily: 'avenirB'),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.08),
                  child: Text(
                    "Select a price range",
                    style: h20,
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                FlutterSlider(
                  values: [start.state, end.state],
                  rangeSlider: true,
                  max: 10000,
                  min: 0,
                  touchSize: 5,
                  minimumDistance: 2000,
                  handlerHeight: 40.h,
                  trackBar: FlutterSliderTrackBar(
                    inactiveTrackBarHeight: 2,
                    activeTrackBarHeight: 2,
                    activeTrackBar: BoxDecoration(color: brownGoldColor),
                  ),
                  handler: FlutterSliderHandler(
                    decoration: BoxDecoration(),
                    child: Stack(
                      children: [
                        Center(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 4,
                                  blurRadius: 8,
                                  offset:
                                      Offset(0, 1), // changes position of shadow
                                ),
                              ],
                            ),
                            width: 10,
                            height: 10,
                          ),
                        ),
                        Center(
                          child: SvgPicture.asset(
                            'assets/icons/slider.svg',
                            width: 30.w,
                          ),
                        ),
                      ],
                    ),
                  ),
                  rightHandler: FlutterSliderHandler(
                    decoration: BoxDecoration(),
                    child: Stack(
                      children: [
                        Center(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 4,
                                  blurRadius: 8,
                                  offset:
                                      Offset(0, 1), // changes position of shadow
                                ),
                              ],
                            ),
                            width: 10,
                            height: 10,
                          ),
                        ),
                        Center(
                          child: SvgPicture.asset(
                            'assets/icons/slider.svg',
                            width: 30.w,
                          ),
                        ),
                      ],
                    ),
                  ),
                  tooltip: FlutterSliderTooltip(
                    custom: (value) {
                      return Text('€${value.round()}');
                    },
                    textStyle: b14,
                    alwaysShowTooltip: true,
                    boxStyle: FlutterSliderTooltipBox(
                        decoration: BoxDecoration(
                      color: Colors.transparent,
                    )),
                  ),
                  onDragging: (handlerIndex, lowerValue, upperValue) {
                    start.state = lowerValue;
                    end.state = upperValue;
                  },
                ),
                
                SizedBox(height: 25.h,),
                Align(
                  child: ButtonFill(
                    color: brownGoldColor,
                    fuction: () {
                      Navigator.pop(context);
                    },
                    message: "APPLY",
                    width: w5 * 3,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Align(
                  child: ButtonFill2(
                    color: brownGoldColor.withOpacity(0.16),
                    fuction: () {
                      selections.clear();
                      start.state = 0;
                      end.state = 10000;
                    },
                    message: "CLEAR FILTER",
                    width: w5 * 3,
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
