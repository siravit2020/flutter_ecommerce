import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../color_plate.dart';
class StarRow extends StatelessWidget {
  const StarRow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/icons/star.svg',
          color: brownGoldColor,
        ),
        SizedBox(
          width: 4,
        ),
        SvgPicture.asset(
          'assets/icons/star.svg',
          color: brownGoldColor,
        ),
        SizedBox(
          width: 4,
        ),
        SvgPicture.asset(
          'assets/icons/star.svg',
          color: brownGoldColor,
        ),
        SizedBox(
          width: 4,
        ),
        SvgPicture.asset(
          'assets/icons/star.svg',
          color: brownGoldColor,
        ),
        SizedBox(
          width: 4,
        ),
        SvgPicture.asset(
          'assets/icons/star.svg',
          color: brownGoldColor.withOpacity(0.3),
        ),
        
      ],
    );
  }
}
