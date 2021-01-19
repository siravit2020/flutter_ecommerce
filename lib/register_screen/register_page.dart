import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecommerce/global_widgets/global_widgets.dart';
import 'package:flutter_ecommerce/text_style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../color_plate.dart';

final visiblePassword = ChangeNotifierProvider<VisiblePassword>((ref) {
  return VisiblePassword();
});

final controllerChange = ChangeNotifierProvider<ControllerChange>((ref) {
  return ControllerChange();
});

class VisiblePassword extends ChangeNotifier {
  bool password = true;
  void change() {
    password = !password;
    notifyListeners();
  }
}

class ControllerChange extends ChangeNotifier {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  
}

class RegisterPage extends ConsumerWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final visible = watch(visiblePassword);
    final controller = watch(controllerChange);
    final w = 1.sw;
    final w5 = w / 5;
    final height = 1.sh - kToolbarHeight;

    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          appBar: StandardAppbar(
            title: "REGISTER",
          ),
          body: Container(
            constraints: new BoxConstraints(
              minHeight: height,
            ),
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(20.0),
                topRight: const Radius.circular(20.0),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: 38.5.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * 0.08),
                    child: Text(
                      "Create your account",
                      style: h30,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * 0.08),
                    child: Text(
                        "After your registration is complete \n you can see our opportunity products.",
                        style: b14,
                        textAlign: TextAlign.center),
                  ),
                  SizedBox(
                    height: 29.5.h,
                  ),
                  TextFieldBrown(
                    label: "Username",
                    controller: controller.usernameController,
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  TextFieldBrown(
                    label: "Email",
                    controller: controller.emailController,
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * 0.08),
                    child: Stack(
                      alignment: const Alignment(1.0, 1.0),
                      children: [
                        TextField(
                          style: b16,
                          cursorColor: Color(0xffAA7E6F),
                          obscureText: visible.password,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffE5E5E5)),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFCC9D76)),
                            ),
                            contentPadding:
                                EdgeInsets.only(left: 10.w, right: 50.w),
                            labelText: 'Password',
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(0.0),
                          child: IconButton(
                            onPressed: () {
                              visible.change();
                            },
                            icon: Icon((visible.password)
                                ? Icons.visibility
                                : Icons.visibility_off),
                            color: (visible.password)
                                ? Colors.black.withOpacity(0.2)
                                : Color(0xffCC9D76),
                            iconSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * 0.08),
                    child: TextFormField(
                      style: b16,
                      keyboardType: TextInputType.number,
                      cursorColor: Color(0xffAA7E6F),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffE5E5E5)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFCC9D76)),
                        ),
                        contentPadding: EdgeInsets.only(left: 10.w),
                        labelText: 'Phone',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  ButtonFill(
                    message: "SIGN UP",
                    color: brownGoldColor,
                    fuction: () {
                      Navigator.pushNamed(context, '/loading');
                    },
                    width: w5 * 3,
                  ),
                  SizedBox(
                    height: 36.h,
                  ),
                  FlatButton(
                    minWidth: w5 * 3,
                    padding: EdgeInsets.fromLTRB(20, 12, 20, 12),
                    onPressed: () {},
                    textColor: Color(0xffDE4D3B),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22.0),
                        side: BorderSide(
                          color: Color(0xffDE4D3B),
                        )),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/google.svg',
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Text(
                          "Continue with Google",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: 'avenirB',
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  FlatButton(
                    minWidth: w5 * 3,
                    padding: EdgeInsets.fromLTRB(20, 12, 20, 12),
                    onPressed: () {},
                    textColor: Color(0xff4267B2),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22.0),
                        side: BorderSide(
                          color: Color(0xff4267B2),
                        )),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/facebook.svg',
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Text(
                          "Continue with Facebook",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: 'avenirB',
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 28.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: b14,
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          child: Text(
                            "Sign In",
                            style: b14.copyWith(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 16.5.h,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
