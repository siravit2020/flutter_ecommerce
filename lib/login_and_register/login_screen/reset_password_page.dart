import 'dart:ui';

import 'package:email_validator/email_validator.dart';
import 'package:flutter_ecommerce/constants.dart';
import 'package:flutter_ecommerce/global_widgets/global_widgets.dart';
import 'package:flutter_ecommerce/text_style.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:flutter_ecommerce/color_plate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPassword extends ConsumerWidget {
  const ResetPassword(this.pageController, {Key key}) : super(key: key);
  final PageController pageController;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _formKey = GlobalKey<FormState>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 44.h,
        ),
        Text(
          "Forgot your password?",
          style: h30,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
            "Enter your email address and we will send you \n instructions on how to reset your password.",
            style: b14,
            textAlign: TextAlign.center),
        SizedBox(
          height: 49.5.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 1.sw * 0.08),
          child: Form(
            key: _formKey,
            child: TextFormField(
                validator: (value) => EmailValidator.validate(value)
                    ? null
                    : "Please enter a valid email",
                style: b16,
                cursorColor: const Color(0xffAA7E6F),
                decoration: decoration.copyWith(labelText: 'Email address')),
          ),
        ),
        Spacer(),
        ButtonFill(
          fuction: () {
            if (_formKey.currentState.validate()) {
              Navigator.pushNamed(context, '/sendemail').then((value) => pageController.jumpToPage(0));
              
            }
          },
          color: brownGoldColor,
          message: "RECOVER EMAIL",
          width: (1.sw / 5) * 3,
        ),
        SizedBox(
          height: 16.5.h,
        ),
      ],
    );
  }
}
