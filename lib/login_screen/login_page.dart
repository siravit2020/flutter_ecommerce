import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecommerce/color_plate.dart';
import 'package:flutter_ecommerce/global_widgets/global_widgets.dart';
import 'package:flutter_ecommerce/loading_screen/loading_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    final w = MediaQuery.of(context).size.width;
    final w5 = MediaQuery.of(context).size.width / 5;

    final height = MediaQuery.of(context).size.height - kToolbarHeight;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            centerTitle: true,
            leading: IconButton(
              splashRadius: 20,
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              icon: SvgPicture.asset(
                'assets/icons/backArrow.svg',
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.black,
            title: Text(
              "LOG IN",
              style: TextStyle(
                  fontSize: 13, fontFamily: 'avenirB', color: Colors.white),
            ),
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
                    height: 34.5,
                  ),
                  Text(
                    "Let’s sign you in",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontFamily: 'avenirH'),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text("Welcome back, you’ve been missed!",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'avenirB',
                      ),
                      textAlign: TextAlign.center),
                  SizedBox(
                    height: 49.5,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * 0.08),
                    child: TextField(
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
                        contentPadding: EdgeInsets.only(left: 10),
                        labelText: 'Username or email',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * 0.08),
                    child: Stack(
                      alignment: const Alignment(1, 1),
                      children: [
                        TextFormField(
                            cursorColor: Color(0xffAA7E6F),
                            style: (passwordColor.state)
                                ? TextStyle(color: Colors.red)
                                : TextStyle(),
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
                                  EdgeInsets.only(left: 10, right: 50),
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
                    height: 25,
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
                                height: 24.0,
                                width: 24.0,
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
                                width: 10,
                              ),
                              Text("Remember me"),
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
                    height: 40,
                  ),
                  ButtonFill(
                    width: w5 * 3,
                    color: brownGoldColor,
                    fuction: () {
                      if (check.username == "admin" && check.passwrod == "1234")
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoadingPage(nextPage: '/',)),
                        );
                    },
                    message: "SIGN IN",
                  ),
                  SizedBox(
                    height: 97,
                  ),
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
                          width: 20,
                        ),
                        Text(
                          "Continue with Google",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'avenirB',
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
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
                          width: 20,
                        ),
                        Text(
                          "Continue with Facebook",
                          style: TextStyle(
                            fontSize: 14,
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
                        style: TextStyle(color: Color(0xff676870)),
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
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 34.5,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
