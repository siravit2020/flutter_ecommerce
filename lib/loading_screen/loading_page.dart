import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/color_plate.dart';
import 'package:flutter_ecommerce/text_style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  List<Color> color = [
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
      if (widget.nextPage != "null") if (t.tick == 20) {
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
            child: SizedBox(
              height: 80,
              width: 80,
              child: Center(
                child: Stack(
                  children: [
                    line(
                      context,
                      radius * cos(5 * pi / 3),
                      radius * sin(5 * pi / 3),
                      1,
                      color[(y + 11) % 12],
                    ),
                    line(
                      context,
                      radius * cos(11 * pi / 6),
                      radius * sin(11 * pi / 6),
                      2,
                      color[(y + 10) % 12],
                    ),
                    line(
                      context,
                      radius * cos(2 * pi),
                      radius * sin(2 * pi),
                      3,
                      color[(y + 9) % 12],
                    ),
                    line(
                      context,
                      radius * cos(pi / 6),
                      radius * sin(pi / 6),
                      4,
                      color[(y + 8) % 12],
                    ),
                    line(
                      context,
                      radius * cos(pi / 3),
                      radius * sin(pi / 3),
                      5,
                      color[(y + 7) % 12],
                    ),
                    line(
                      context,
                      radius * cos(pi / 2),
                      radius * sin(pi / 2),
                      6,
                      color[(y + 6) % 12],
                    ),
                    line(
                      context,
                      radius * cos(2 * pi / 3),
                      radius * sin(2 * pi / 3),
                      7,
                      color[(y + 5) % 12],
                    ),
                    line(
                      context,
                      radius * cos(5 * pi / 6),
                      radius * sin(5 * pi / 6),
                      8,
                      color[(y + 4) % 12],
                    ),
                    line(
                      context,
                      radius * cos(pi),
                      radius * sin(pi),
                      9,
                      color[(y + 3) % 12],
                    ),
                    line(
                      context,
                      radius * cos(7 * pi / 6),
                      radius * sin(7 * pi / 6),
                      10,
                      color[(y + 2) % 12],
                    ),
                    line(
                      context,
                      radius * cos(4 * pi / 3),
                      radius * sin(4 * pi / 3),
                      11,
                      color[(y + 1) % 12],
                    ),
                    line(
                      context,
                      radius * cos(3 * pi / 2),
                      radius * sin(3 * pi / 2),
                      12,
                      color[(y) % 12],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Text(
            "LOADING",
            style: m13.copyWith(color: brownGoldColor, letterSpacing: 2),
          ),
        ],
      ),
    );
  }

  Transform line(
      BuildContext context, double x, double y, int index, Color color) {
    return Transform.translate(
      offset: Offset(x, y),
      child: Center(
          child: Container(
        child: SvgPicture.asset(
          'assets/icons/loading${index}.svg',
          color: color,
        ),
      )),
    );
  }
}
