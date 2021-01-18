import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/color_plate.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key key, this.nextPage}) : super(key: key);
  final String nextPage;
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  int y = 0;
  double radius = 15;
  Timer time;
  List<Color> c = [
    brownGoldColor.withOpacity(0.10),
    brownGoldColor.withOpacity(0.15),
    brownGoldColor.withOpacity(0.20),
    brownGoldColor.withOpacity(0.25),
    brownGoldColor.withOpacity(0.25),
    brownGoldColor.withOpacity(0.35),
    brownGoldColor.withOpacity(0.35),
    brownGoldColor.withOpacity(0.45),
    brownGoldColor.withOpacity(0.55),
    brownGoldColor.withOpacity(0.65),
    brownGoldColor.withOpacity(0.75),
    brownGoldColor.withOpacity(0.90),
    brownGoldColor
  ];
  void initState() {
    const oneSec = const Duration(milliseconds: 100);
    time = Timer.periodic(oneSec, (Timer t) {
      print(t.tick);
      if(widget.nextPage != "null")
      if(t.tick == 20){
        Navigator.pop(context);
        Navigator.pushNamed(context, widget.nextPage);
        time.cancel();
      }
      ch();
    });
    super.initState();
  }

  @override
  void dispose() {
    time.cancel();
    super.dispose();
  }

  void ch() {
    y++;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 80,
              width: 80,
              child: Center(
                child: Stack(
                  children: [
                    newMethod(
                      context,
                      radius * cos(0.66 * pi / 4),
                      radius * sin(0.66 * pi / 4),
                      9,
                      c[(y + 8) % 12],
                    ),
                    newMethod(
                      context,
                      radius * cos(1.33 * pi / 4),
                      radius * sin(1.33 * pi / 4),
                      11,
                      c[(y + 7) % 12],
                    ),
                    newMethod(
                      context,
                      radius * cos(2 * pi / 4),
                      radius * sin(2 * pi / 4),
                      2,
                      c[(y + 6) % 12],
                    ),
                    newMethod(
                      context,
                      radius * cos(2.66 * pi / 4),
                      radius * sin(2.66 * pi / 4),
                      4,
                      c[(y + 5) % 12],
                    ),
                    newMethod(
                      context,
                      radius * cos(3.33 * pi / 4),
                      radius * sin(3.33 * pi / 4),
                      6,
                      c[(y + 4) % 12],
                    ),
                    newMethod(
                      context,
                      radius * cos(4 * pi / 4),
                      radius * sin(4 * pi / 4),
                      8,
                      c[(y + 3) % 12],
                    ),
                    newMethod(
                      context,
                      radius * cos(4.66 * pi / 4),
                      radius * sin(4.66 * pi / 4),
                      10,
                      c[(y + 2) % 12],
                    ),
                    newMethod(
                      context,
                      radius * cos(5.33 * pi / 4),
                      radius * sin(5.33 * pi / 4),
                      12,
                      c[(y + 1) % 12],
                    ),
                    newMethod(
                      context,
                      radius * cos(6 * pi / 4),
                      radius * sin(6 * pi / 4),
                      1,
                      c[(y) % 12],
                    ),
                    newMethod(
                      context,
                      radius * cos(6.66 * pi / 4),
                      radius * sin(6.66 * pi / 4),
                      3,
                      c[(y + 11) % 12],
                    ),
                    newMethod(
                      context,
                      radius * cos(7.33 * pi / 4),
                      radius * sin(7.33 * pi / 4),
                      5,
                      c[(y + 10) % 12],
                    ),
                    newMethod(
                      context,
                      radius * cos(8 * pi / 4),
                      radius * sin(8 * pi / 4),
                      7,
                      c[(y + 9) % 12],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Text(
            "LOADING",
            style: TextStyle(color: brownGoldColor, letterSpacing: 5),
          ),
        ],
      ),
    );
  }

  Transform newMethod(
      BuildContext context, double x, double y, int index, Color color) {
    return Transform.translate(
      offset: Offset(x, y),
      child: Center(
          child: SvgPicture.asset(
        'assets/icons/loading$index.svg',
        color: color,
      )),
    );
  }
}
