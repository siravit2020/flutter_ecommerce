import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecommerce/color_plate.dart';
import 'package:flutter_ecommerce/global_widgets/global_widgets.dart';
import 'package:flutter_ecommerce/loading_screen/loading_page.dart';
import 'package:flutter_ecommerce/text_style.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final loginRiverpod = ChangeNotifierProvider<LoginRiverpod>((ref) {
  return LoginRiverpod();
});

final loginCheck = ChangeNotifierProvider<LoginCheck>((ref) {
  return LoginCheck();
});

final passwordColorState = StateProvider<bool>((ref) {
  return false;
});

class LoginCheck extends ChangeNotifier {
  String username = "";
  String passwrod = "";
}

class LoginRiverpod extends ChangeNotifier {
  bool password = true;
  bool remember = false;
  void changePassword() {
    password = !password;
    notifyListeners();
  }

  void changeRemember() {
    remember = !remember;
    notifyListeners();
  }
}

class LoginPage extends ConsumerWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final river = watch(loginRiverpod);
    final check = watch(loginCheck);
    final passwordColor = watch(passwordColorState);
    final w = 1.sw;
    final w5 = w / 5;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false ,
          backgroundColor: Colors.black,
          appBar: StandardAppbar(title: "LOGIN",),
          body: Container(
            decoration: whiteCorner,
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      height: 38.5.h,
                    ),
                    Text(
                      "Let’s sign you in",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30.sp,
                          fontFamily: 'avenirH'),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text("Welcome back, you’ve been missed!",
                        style: b14,
                        textAlign: TextAlign.center),
                    SizedBox(
                      height: 49.5.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: w * 0.08),
                      child: TextField(
                        style: b16,
                        onChanged: (String msg) {
                          check.username = msg;
                        },
                        cursorColor: Color(0xffAA7E6F),
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffE5E5E5)),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFCC9D76)),
                          ),
                          contentPadding: EdgeInsets.only(left: 10.w),
                          labelText: 'Username or email',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: w * 0.08),
                      child: Stack(
                        alignment: const Alignment(1, 1),
                        children: [
                          TextFormField(
                              cursorColor: Color(0xffAA7E6F),
                              style: (passwordColor.state)
                                  ? TextStyle(
                                      color: Colors.red,
                                      fontFamily: 'avenirB',
                                      fontSize: 16.sp,
                                    )
                                  : TextStyle(
                                      fontFamily: 'avenirB',
                                      fontSize: 16.sp,
                                    ),
                              obscureText: river.password,
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xffE5E5E5)),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: (passwordColor.state)
                                          ? Colors.red
                                          : brownGoldColor),
                                ),
                                contentPadding:
                                    EdgeInsets.only(left: 10.w, right: 50.w),
                                labelText: 'Password',
                              ),
                              onChanged: (String newVal) {
                                check.passwrod = newVal;

                                if (newVal.length > 20)
                                  passwordColor.state = true;
                                else
                                  passwordColor.state = false;
                              }),
                          IconButton(
                            onPressed: () {
                              river.changePassword();
                            },
                            icon: Icon((river.password)
                                ? Icons.visibility
                                : Icons.visibility_off),
                            color: (river.password)
                                ? Colors.black.withOpacity(0.2)
                                : Color(0xffCC9D76),
                            iconSize: 16,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Theme(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: 24.h,
                                  width: 24.w,
                                  child: Checkbox(
                                    activeColor: brownGoldColor,
                                    onChanged: (bool newValue) {
                                      river.changeRemember();
                                    },
                                    value: river.remember,
                                    focusColor: Colors.red,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Text(
                                  "Remember me",
                                  style: b14,
                                ),
                              ],
                            ),
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                splashColor: brownGoldColor.withOpacity(0.3),
                                highlightColor: brownGoldColor.withOpacity(0.2),
                                onTap: () {
                                  Navigator.pushNamed(context, '/forgot');
                                },
                                child: Text(
                                  "Forgot password?",
                                  style: b14,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      data: ThemeData(
                        primarySwatch: Colors.blue,

                        unselectedWidgetColor:
                            Color(0xffA5A6AE).withOpacity(0.5), // Your color
                      ),
                    ),
                    Container(
                      color: Colors.orange,
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    ButtonFill(
                      width: w5 * 3,
                      color: brownGoldColor,
                      fuction: () {
                        if (check.username == "admin" &&
                            check.passwrod == "1234")
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoadingPage(
                                      nextPage: '/',
                                    )),
                          );
                      },
                      message: "SIGN IN",
                    ),
                  ],
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FlatButton(
                        minWidth: w5 * 3,
                        padding: EdgeInsets.fromLTRB(20, 12, 20, 12),
                        onPressed: () {
                          Navigator.pushNamed(context, '/verification');
                        },
                        textColor: Color(0xffDE4D3B),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22.0),
                            side: BorderSide(
                              color: Color(0xffDE4D3B),
                            )),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
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
                        height: 28,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don’t have an account? ",
                            style: b14,
                          ),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {
                                Navigator.pushNamed(context, '/register');
                              },
                              child: Text(
                                "Sign Up",
                                style: b14.copyWith(color: Colors.black),
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
              ],
            ),
          )),
    );
  }
}
