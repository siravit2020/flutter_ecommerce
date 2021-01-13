import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_ecommerce/color_plate.dart';
import 'dart:math' as math show sin, pi, sqrt;

import 'package:flutter_svg/flutter_svg.dart';

class RipplesAnimation extends StatefulWidget {
  final String icon;
  final double size = 100;

  const RipplesAnimation({Key key, this.icon}) : super(key: key);

  @override
  _RipplesAnimationState createState() => _RipplesAnimationState();
}

class _RipplesAnimationState extends State<RipplesAnimation>
    with TickerProviderStateMixin {
  AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _button() {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(widget.size),
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: <Color>[
                brownGoldColor,
                Color.lerp(brownGoldColor, Colors.black, .05)
              ],
            ),
          ),
          child: ScaleTransition(
              scale: Tween(begin: 0.95, end: 1.0).animate(
                CurvedAnimation(
                  parent: _controller,
                  curve: const CurveWave(),
                ),
              ),
              child: SvgPicture.asset('assets/icons/${widget.icon}')),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        painter: CirclePainter(
          _controller,
        ),
        child: SizedBox(
          width: widget.size + 40,
          height: widget.size + 40,
          child: _button(),
        ),
      ),
    );
  }
}

class CurveWave extends Curve {
  const CurveWave();
  @override
  double transform(double t) {
    if (t == 0 || t == 1) {
      return 0.01;
    }
    return math.sin(t * math.pi);
  }
}

class CirclePainter extends CustomPainter {
  CirclePainter(
    this._animation,
  ) : super(repaint: _animation);
  final Color color = Color(0xffA87E6F);
  final Animation<double> _animation;

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromLTRB(0.0, 0.0, size.width, size.height);
    for (int wave = 4; wave >= 0; wave--) {
      circle(canvas, rect, wave + _animation.value);
    }
  }

  void circle(Canvas canvas, Rect rect, double value) {
    final double opacity = (1.0 - (value / 4)).clamp(0.0, 0.1);
    final Color _color = color.withOpacity(opacity);
    final double size = rect.width / 1.5;
    final double area = size * size;
    final double radius = math.sqrt(area * value / 6);
    final Paint paint = Paint()..color = _color;
    canvas.drawCircle(rect.center, radius, paint);
  }

  @override
  bool shouldRepaint(CirclePainter oldDelegate) => true;
}
