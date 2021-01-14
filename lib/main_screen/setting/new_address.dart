import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecommerce/color_plate.dart';
import 'package:flutter_ecommerce/global_widgets/global_widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewAddress extends ConsumerWidget {
  const NewAddress({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
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
              "MY ADDRESS",
              style: TextStyle(
                  fontSize: 13, fontFamily: 'avenirB', color: Colors.white),
            ),
          ),
          body: Container(
            width: double.infinity,
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
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * 0.08),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        TextField(
                          onChanged: (String msg) {},
                          cursorColor: Color(0xffAA7E6F),
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffE5E5E5)),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFCC9D76)),
                            ),
                            contentPadding: EdgeInsets.only(left: 10),
                            labelText: 'Address Line1',
                            labelStyle: TextStyle(
                              fontSize: 16,
                              fontFamily: 'avenirB',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextField(
                          onChanged: (String msg) {},
                          cursorColor: Color(0xffAA7E6F),
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffE5E5E5)),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFCC9D76)),
                            ),
                            contentPadding: EdgeInsets.only(left: 10),
                            labelText: 'Address Line2',
                            labelStyle: TextStyle(
                              fontSize: 16,
                              fontFamily: 'avenirB',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        GestureDetector(
                          onTap: () {
                            print("click${Random().nextInt(10)}");
                          },
                          child: Stack(
                            children: [
                              TextField(
                                enabled: false,
                                onChanged: (String msg) {},
                                cursorColor: Color(0xffAA7E6F),
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xffE5E5E5)),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFFCC9D76)),
                                  ),
                                  contentPadding: EdgeInsets.only(left: 10),
                                  labelText: 'Country',
                                  labelStyle: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'avenirB',
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 17,
                                right: 10,
                                child: SvgPicture.asset(
                                  'assets/icons/arrow_right.svg',
                                  width: 12,
                                  height: 12,
                                  color: Colors.black,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        GestureDetector(
                          onTap: () {
                            print("click${Random().nextInt(10)}");
                          },
                          child: Stack(
                            children: [
                              TextField(
                                enabled: false,
                                onChanged: (String msg) {},
                                cursorColor: Color(0xffAA7E6F),
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xffE5E5E5)),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFFCC9D76)),
                                  ),
                                  contentPadding: EdgeInsets.only(left: 10),
                                  labelText: 'City',
                                  labelStyle: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'avenirB',
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 17,
                                right: 10,
                                child: SvgPicture.asset(
                                  'assets/icons/arrow_right.svg',
                                  width: 12,
                                  height: 12,
                                  color: Colors.black,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextField(
                          onChanged: (String msg) {},
                          cursorColor: Color(0xffAA7E6F),
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffE5E5E5)),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFCC9D76)),
                            ),
                            contentPadding: EdgeInsets.only(left: 10),
                            labelText: 'Zip Code',
                            labelStyle: TextStyle(
                              fontSize: 16,
                              fontFamily: 'avenirB',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Set Default Address",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'avenirB',
                                ),
                              ),
                              SizedBox(
                                width: 20,
                                child: Transform.scale(
                                  scale: 0.6,
                                  child: CupertinoSwitch(
                                    activeColor: brownGoldColor,
                                    value: true,
                                    onChanged: (bool value) {},
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 16.5,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: FlatButton(
                      minWidth: w5 * 3,
                      padding: EdgeInsets.fromLTRB(20, 12, 20, 12),
                      onPressed: () {},
                      color: brownGoldColor,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22.0),
                      ),
                      child: Text(
                        "SAVE ADDRESS",
                        style: TextStyle(
                          letterSpacing: 1.5,
                          fontSize: 13,
                          fontFamily: 'avenirM',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
