import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecommerce/color_plate.dart';
import 'package:flutter_ecommerce/global_widgets/global_widgets.dart';
import 'package:flutter_ecommerce/loading_screen/loading_page.dart';
import 'package:flutter_ecommerce/text_style.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Loginod extends ChangeNotifier {

  TextEditingController emailController;
  TextEditingController passwordController;
  bool passwordStatus = true;
  bool remember = false;

  void start() async {
    SharedPreferences.getInstance().then((prefs) {
      print("ss");
      if (prefs.getBool('remember') != null) {
        if (prefs.getBool('remember')) {
          print(prefs.getBool('remember'));
          remember = true;
          emailController.text = prefs.getString('email');
          passwordController.text = prefs.getString('password');
        }
      }
    });
  }
}

_remember(String email, String password, bool remember) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('remember', remember);
  await prefs.setString('email', email);
  await prefs.setString('password', password);
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username;
  String password;
  TextEditingController emailController;
  TextEditingController passwordController;
  bool passwordStatus = true;
  bool remember = false;
  bool passwordColor = false;

  void start() async {
    SharedPreferences.getInstance().then((prefs) {
      print("ss");
      if (prefs.getBool('remember') != null) {
        if (prefs.getBool('remember')) {
          print(prefs.getBool('remember'));
          remember = true;
          emailController.text = prefs.getString('email');
          passwordController.text = prefs.getString('password');
          setState(() {});
        }
      }
    });
  }

  void initState() {
    super.initState();
    start();
  }

  @override
  void dispose() {
    if (!remember) {
      SharedPreferences.getInstance().then((prefs) {
        prefs.setBool('remember', false);
        prefs.setString('email', username);
        prefs.setString('password', password);
      });
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final w = 1.sw;
    final w5 = w / 5;

    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomPadding: false,
          backgroundColor: Colors.black,
          appBar: StandardAppbar(
            title: "LOGIN",
          ),
          body: Builder(
            builder: (ctx) => Container(
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
                          style: b14, textAlign: TextAlign.center),
                      SizedBox(
                        height: 49.5.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: w * 0.08),
                        child: TextField(
                          style: b16,
                          controller: emailController,
                          onChanged: (String msg) {
                            username = msg;
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
                            labelText: 'Email',
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
                                controller: passwordController,
                                cursorColor: (passwordColor)
                                    ? Colors.red
                                    : brownGoldColor,
                                style: (passwordColor)
                                    ? TextStyle(
                                        color: Colors.red,
                                        fontFamily: 'avenirB',
                                        fontSize: 16.sp,
                                      )
                                    : TextStyle(
                                        fontFamily: 'avenirB',
                                        fontSize: 16.sp,
                                      ),
                                obscureText: passwordStatus,
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xffE5E5E5)),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: (passwordColor)
                                            ? Colors.red
                                            : brownGoldColor),
                                  ),
                                  contentPadding:
                                      EdgeInsets.only(left: 10.w, right: 50.w),
                                  labelText: 'Password',
                                ),
                                onChanged: (String newVal) {
                                  password = newVal;
                                  if (newVal.length > 20)
                                    passwordColor = true;
                                  else
                                    passwordColor = false;

                                  setState(() {});
                                }),
                            IconButton(
                              onPressed: () {
                                passwordStatus = !passwordStatus;
                                setState(() {});
                              },
                              icon: Icon((passwordStatus)
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              color: (passwordStatus)
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
                                        remember = newValue;

                                        setState(() {});
                                      },
                                      value: remember,
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
                                  highlightColor:
                                      brownGoldColor.withOpacity(0.2),
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
                        color: (passwordColor)
                            ? brownGoldColor.withOpacity(0.5)
                            : brownGoldColor,
                        fuction: () async {
                          if (!passwordColor) {
                            if (remember) {
                              print("mem");
                              _remember(username, password, remember);
                            }
                            showGeneralDialog(
                              context: context,
                              barrierDismissible: false,
                              transitionDuration: Duration(milliseconds: 400),
                              pageBuilder: (_, __, ___) {
                                return LoadingPage(
                                  nextPage: "null",
                                );
                              },
                            );
                            try {
                              print("asdasdasd");
                              print(username);
                              print(password);
                              UserCredential userCredential = await FirebaseAuth
                                  .instance
                                  .signInWithEmailAndPassword(
                                      email: username, password: password);
                              Navigator.pop(context);
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  '/main', (Route<dynamic> route) => false);
                            } on FirebaseAuthException catch (e) {
                              Navigator.pop(context);
                              if (e.code == 'user-not-found') {
                                final snackBar = SnackBar(
                                    content:
                                        Text('No user found for that email.'));
                                Scaffold.of(ctx).showSnackBar(snackBar);
                              } else if (e.code == 'wrong-password') {
                                final snackBar = SnackBar(
                                    content: Text(
                                        'Wrong password provided for that user.'));
                                Scaffold.of(ctx).showSnackBar(snackBar);
                              }
                            }
                          }
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
            ),
          )),
    );
  }
}
