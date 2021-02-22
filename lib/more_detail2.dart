import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/color_plate.dart';
import 'package:flutter_ecommerce/main_screen/widgets/star.dart';
import 'package:flutter_ecommerce/text_style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'constants.dart';

class MoreDetails2 extends StatefulWidget {
  @override
  _MoreDetails2State createState() => _MoreDetails2State();
}

class _MoreDetails2State extends State<MoreDetails2> {
  List<double> y = [450, 650, 1000];
  List<Widget> w = [DescriptionPage(), SpecificationsPage(), Reviews()];
  int i = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          DefaultTabController(
            length: 3, // length of tabs
            initialIndex: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Color(0xffE4E4E7),
                                width: 2.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      TabBar(
                          onTap: (int index) {
                            i = index;
                            setState(() {});
                          },
                          isScrollable: true,
                          indicatorColor: brownGoldColor,
                          indicatorSize: TabBarIndicatorSize.label,
                          tabs: [
                            Tab(
                              child: Text(
                                "Description",
                                style: h24.copyWith(color: Colors.black),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Tab(
                              child: Text(
                                'Specifications',
                                style: h24.copyWith(color: Colors.black),
                              ),
                            ),
                            Tab(
                              child: Text(
                                'Reviews',
                                style: h24.copyWith(color: Colors.black),
                              ),
                            ),
                          ]),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      color: Colors.white,
                      child: w[i],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DescriptionPage extends StatelessWidget {
  const DescriptionPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 1.sw * 0.08),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 20.h,
            ),
            Container(
              child: Text(
                'The ewers were used for washing hands and face in Ottoman culture, and their different forms were used in the service of liquid drinks such as sherbet in the mansion, especially in the palace kitchen.',
                style: b14,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 21.5.h,
            ),
          ],
        ),
      ),
    );
  }
}

class SpecificationsPage extends StatefulWidget {
  @override
  _SpecificationsPageState createState() => _SpecificationsPageState();
}

class _SpecificationsPageState extends State<SpecificationsPage> {
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w * 0.08),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 20.h,
          ),
          item("Case diameter", "Diameter: 20 cm Length: 40 cm"),
          Divider(
            height: 40.h,
            thickness: 1,
          ),
          item("Product Origin", "Turkey"),
          Divider(
            height: 40.h,
            thickness: 1,
          ),
          item("Production method", "100% handmade."),
          Divider(
            height: 40.h,
            thickness: 1,
          ),
          item("Material", "Gold and Glass crafting"),
          Divider(
            height: 40.h,
            thickness: 1,
          ),
          item("Strap color", "Gold Color"),
          SizedBox(
            height: 21.5.h,
          ),
        ],
      ),
    );
  }

  Row item(String title, String message) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: b14,
        ),
        Text(
          message,
          style: b14.copyWith(color: Colors.black),
        ),
      ],
    );
  }
}

class Reviews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(left: w * 0.08, right: w * 0.08),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(height: 20.h),
          reviewComment(false, '', "Victor Flexin"),
          Divider(
            height: 60.h,
            thickness: 1,
          ),
          reviewComment(false, '', "Mike Flexin"),
          Divider(
            height: 60.h,
            thickness: 1,
          ),
          reviewComment(true, 'non.png', "Non Nonny"),
          SizedBox(
            height: 21.5.h,
          ),
        ],
      ),
    );
  }

  Column reviewComment(bool typeImage, String image, String name) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                (typeImage)
                    ? Container(
                        width: 50.0.h,
                        height: 50.0.h,
                        decoration: BoxDecoration(
                          color: Color(0xffF7F7F7),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/image/$image'),
                          ),
                        ),
                      )
                    : Container(
                        width: 50.0.h,
                        height: 50.0.h,
                        decoration: BoxDecoration(
                          color: Colors.grey[200]
                          //Color(0xffF7F7F7)
                          ,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                            child: SvgPicture.asset(
                          'assets/icons/photo.svg',
                          width: 20.h,
                          height: 20.h,
                          color: Colors.black.withOpacity(0.3),
                        )),
                      ),
                SizedBox(
                  width: 18.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(color: Colors.black, fontSize: 16.sp, fontFamily: 'avenirBl'),
                    ),
                    StarRow(),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(
                "27 November 2019",
                style: b12.copyWith(color: Colors.black),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 21.h,
        ),
        Text(
          "The dial on this timepiece is extremely unique, as it is a concentric circular pattern that is covered by sturdy sapphire glass.",
          style: b14,
        ),
        SizedBox(
          height: 19.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FlatButton(
              minWidth: 110.w,
              height: 36.h,
              color: Colors.grey[200].withOpacity(0.7),
              child: Text(
                "Helpful?",
                style: b14,
              ),
              onPressed: () {},
            ),
            GestureDetector(
              onTap: () {
                print("click");
              },
              child: Text(
                "Report",
                style: b14.copyWith(color: brownGoldColor),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
