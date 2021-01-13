import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecommerce/global_widgets/global_widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../color_plate.dart';

final visiblePassword = ChangeNotifierProvider<VisiblePassword>((ref) {
  return VisiblePassword();
});

class VisiblePassword extends ChangeNotifier {
  bool password = true;
  void change() {
    password = !password;
    notifyListeners();
  }
}

class RegisterPage extends ConsumerWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final visible = watch(visiblePassword);
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
                 Navigator.pop(context);
              },
              icon: SvgPicture.asset(
                'assets/icons/backArrow.svg',
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.black,
            title: Text(
              "REGISTER",
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
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * 0.08),
                    child: Text(
                      "Create your account",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontFamily: 'avenirH'),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * 0.08),
                    child: Text(
                        "After your registration is complete \n you can see our opportunity products.",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'avenirB',
                        ),
                        textAlign: TextAlign.center),
                  ),
                  SizedBox(
                    height: 29.5,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * 0.08),
                    child: TextField(
                      style: TextStyle(fontFamily: 'avenirB', fontSize: 16),
                      cursorColor: Color(0xffAA7E6F),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffE5E5E5)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFCC9D76)),
                        ),
                        contentPadding: EdgeInsets.only(left: 10),
                        labelText: 'Username',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * 0.08),
                    child: TextField(
                      style: TextStyle(fontFamily: 'avenirB', fontSize: 16),
                      cursorColor: Color(0xffAA7E6F),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffE5E5E5)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFCC9D76)),
                        ),
                        contentPadding: EdgeInsets.only(left: 10),
                        labelText: 'Email',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * 0.08),
                    child: Stack(
                      alignment: const Alignment(1.0, 1.0),
                      children: [
                        TextField(
                          style: TextStyle(
                            fontFamily: 'avenirB',
                            fontSize: 16,
                          ),
                          cursorColor: Color(0xffAA7E6F),
                          obscureText: visible.password,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffE5E5E5)),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFCC9D76)),
                            ),
                            contentPadding: EdgeInsets.only(left: 10),
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
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: TextField(
                      style: TextStyle(fontFamily: 'avenirB', fontSize: 16),
                      keyboardType: TextInputType.number,
                      cursorColor: Color(0xffAA7E6F),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffE5E5E5)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFCC9D76)),
                        ),
                        contentPadding: EdgeInsets.only(left: 10),
                        labelText: 'Phone',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
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
                    height: 30,
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
                        "Already have an account? ",
                        style: TextStyle(color: Color(0xff676870)),
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
