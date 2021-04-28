import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../text_style.dart';

class ButtonFill extends StatelessWidget {
  final double width;
  final String message;
  final Function fuction;
  final Color color;
  const ButtonFill({
    Key key,
    @required this.width,
    @required this.message,
    @required this.fuction,
    @required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        primary: Colors.white,
        minimumSize: Size(width, 0),
        padding: EdgeInsets.fromLTRB(
          20.w,
          12.h,
          20.w,
          12.h,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22.0),
        ),
        backgroundColor: color,
      ),
      onPressed: fuction,
      child: Text(
        message,
        style: TextStyle(
          letterSpacing: 2,
          fontSize: 15.sp,
          fontFamily: 'avenirM',
        ),
      ),
    );
  }
}

class TextFieldBrown extends StatelessWidget {
  final TextEditingController controller;
  final String label;

  const TextFieldBrown({
    Key key,
    @required this.controller,
    @required this.label,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 1.sw * 0.08),
      child: TextField(
        controller: controller,
        style: TextStyle(fontFamily: 'avenirB', fontSize: 16.sp),
        cursorColor: Color(0xffAA7E6F),
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xffE5E5E5)),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFCC9D76)),
          ),
          contentPadding: EdgeInsets.only(left: 10.w),
          labelText: label,
        ),
      ),
    );
  }
}

class ButtonFill2 extends StatelessWidget {
  final double width;
  final String message;
  final Function fuction;
  final Color color;
  const ButtonFill2({
    Key key,
    @required this.width,
    @required this.message,
    @required this.fuction,
    @required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
     
      onPressed: fuction,
     style: TextButton.styleFrom(
        primary: Colors.black,
        minimumSize: Size(width, 0),
        padding: EdgeInsets.fromLTRB(
          20.w,
          12.h,
          20.w,
          12.h,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22.0),
        ),
        backgroundColor: color,
      ),
      child: Text(
        message,
        style: TextStyle(
          letterSpacing: 2,
          fontSize: 13.sp,
          fontFamily: 'avenirM',
        ),
      ),
    );
  }
}

BoxDecoration whiteCorner = BoxDecoration(
  color: Colors.white,
  borderRadius: new BorderRadius.only(
    topLeft: const Radius.circular(20.0),
    topRight: const Radius.circular(20.0),
  ),
);

class StandardAppbar extends StatelessWidget with PreferredSizeWidget {
  final String title;

  const StandardAppbar({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: IconButton(
        splashRadius: 20,
        onPressed: () {
          Navigator.pop(context);
        },
        icon: SvgPicture.asset(
          'assets/icons/backArrow.svg',
          color: Colors.white,
          width: 20.w,
        ),
      ),
      backgroundColor: Colors.black,
      title: Text(
        title,
        style: b13.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }

  @override

  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class TextBottom extends StatelessWidget {
  final String text;
  final String text2;
  final String target;

  const TextBottom({Key key, this.text, this.text2, this.target})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: b14,
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              Navigator.popAndPushNamed(context, target);
            },
            child: Text(
              text2,
              style: b14.copyWith(
                color: Colors.black,
              ),
            ),
          ),
        )
      ],
    );
  }
}
