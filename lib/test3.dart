import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/color_plate.dart';
import 'dart:math';

import 'package:flutter_svg/flutter_svg.dart';

class Test3 extends StatefulWidget {
  Test3({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Test3State createState() => _Test3State();
}

class _Test3State extends State<Test3> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  int y = 0;
  double radius = 15;
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
  @override
  void initState() {
    const oneSec = const Duration(milliseconds: 100);
    new Timer.periodic(oneSec, (Timer t) => ch());
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
  }

  void ch() {
    print("dd");
    y++;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Scaffold(
            body: Container(
              child: Center(
                child: Stack(
                  children: [
                    newMethod(context, radius * cos(0.66 * pi / 4),
                        radius * sin(0.66 * pi / 4), 9,c[(y+8)%12]),
                    newMethod(context, radius * cos(1.33 * pi / 4),
                        radius * sin(1.33 * pi / 4), 11,c[(y+7)%12]),
                    newMethod(context, radius * cos(2 * pi / 4),
                        radius * sin(2 * pi / 4), 2,c[(y+6)%12]),
                    newMethod(context, radius * cos(2.66 * pi / 4),
                        radius * sin(2.66 * pi / 4), 4,c[(y+5)%12]),
                    newMethod(context, radius * cos(3.33 * pi / 4),
                        radius * sin(3.33 * pi / 4), 6,c[(y+4)%12]),
                    newMethod(context, radius * cos(4 * pi / 4),
                        radius * sin(4 * pi / 4), 8,c[(y+3)%12]),
                    newMethod(context, radius * cos(4.66 * pi / 4),
                        radius * sin(4.66 * pi / 4), 10,c[(y+2)%12]),
                    newMethod(context, radius * cos(5.33 * pi / 4),
                        radius * sin(5.33 * pi / 4), 12,c[(y+1)%12]),
                    newMethod(context, radius * cos(6 * pi / 4),
                        radius * sin(6 * pi / 4), 1,c[(y)%12]),
                    newMethod(context, radius * cos(6.66 * pi / 4),
                        radius * sin(6.66 * pi / 4), 3,c[(y+11)%12]),
                    newMethod(context, radius * cos(7.33 * pi / 4),
                        radius * sin(7.33 * pi / 4), 5,c[(y+10)%12]),
                    newMethod(context, radius * cos(8 * pi / 4),
                        radius * sin(8 * pi / 4), 7,c[(y+9)%12]),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Transform newMethod(BuildContext context, double x, double y, int index,Color color) {
    return Transform.translate(
      offset: Offset(x, y),
      child: Center(child: SvgPicture.asset('assets/icons/loading$index.svg',color: color,)),
      // child: CustomPaint(
      //   painter: ClockPainter(context, x, y),
      // ),
    );
  }
}

class ClockPainter extends CustomPainter {
  final BuildContext context;
  final double x;
  final double y;

  ClockPainter(this.context, this.x, this.y);

  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    Offset center = Offset(centerX, centerY);

    canvas.drawLine(
      center,
      Offset(x, y),
      Paint()
        ..color = Theme.of(context).colorScheme.secondary
        ..style = PaintingStyle.stroke
        ..strokeWidth = 6,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
