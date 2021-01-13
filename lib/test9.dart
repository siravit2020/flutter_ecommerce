import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/color_plate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

class Test9 extends StatefulWidget {
  @override
  _Test9State createState() => _Test9State();
}

double v = 0;
double _lowerValue = 0;

double _upperValue = 500;

class _Test9State extends State<Test9> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.amber.withOpacity(0.4),
          child: Center(
            child: Column(
              children: [

                FlutterSlider(
                  values: [_lowerValue, _upperValue],
                  rangeSlider: true,
                  max: 2000,
                  min: 0,
                  handlerHeight: 40,
                  trackBar: FlutterSliderTrackBar(
                    inactiveTrackBarHeight: 2,
                    activeTrackBarHeight: 2,
                    activeTrackBar: BoxDecoration(color: brownGoldColor),
                  ),
                  handler: FlutterSliderHandler(
                    decoration: BoxDecoration(),
                    child: SvgPicture.asset(
                      'assets/icons/slider.svg',
                      width: 30,
                      height: 30,
                    ),
                  ),
                  rightHandler: FlutterSliderHandler(
                    decoration: BoxDecoration(),
                    child: SvgPicture.asset(
                      'assets/icons/slider.svg',
                      width: 30,
                      height: 30,
                    ),
                  ),
                  tooltip: FlutterSliderTooltip(
                    custom: (value) {
                      return Text('€${value.round()}');
                    },
                    textStyle: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontFamily: 'avenirB'),
                    alwaysShowTooltip: true,
                    boxStyle: FlutterSliderTooltipBox(
                        decoration: BoxDecoration(
                      color: Colors.transparent,
                    )),
                  ),
                  onDragging: (handlerIndex, lowerValue, upperValue) {
                    _lowerValue = lowerValue;
                    _upperValue = upperValue;
                    setState(() {});
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

