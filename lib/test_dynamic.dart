import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecommerce/color_plate.dart';
import 'package:flutter_ecommerce/constants.dart';
import 'package:flutter_ecommerce/country_data.dart';
import 'package:flutter_ecommerce/global_widgets/global_widgets.dart';
import 'package:flutter_ecommerce/select_country.dart';
import 'package:flutter_ecommerce/text_style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'main_screen/widgets/star.dart';

final controllerState = StateProvider<PageController>((ref) {
  return PageController(initialPage: 0);
});

class TestDynamic extends ConsumerWidget {
  const TestDynamic({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final w = MediaQuery.of(context).size.width;
    final w5 = MediaQuery.of(context).size.width / 5;
    final height = MediaQuery.of(context).size.height - kToolbarHeight;
    final controller = watch(controllerState);

    ScrollController _scrollViewController;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        body: NestedScrollView(
          controller: _scrollViewController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                centerTitle: true,
                leading: IconButton(
                  splashRadius: 20,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: SvgPicture.asset(
                    'assets/icons/backArrow.svg',
                    color: Colors.black,
                    width: 20.w,
                  ),
                ),
                backgroundColor: Colors.white,
                title: Text(
                  "PRODUCT DETAILS",
                  style: b13,
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  width: double.infinity,
                  constraints: BoxConstraints(
                    minHeight: 200,
                  ),
                  color: Colors.amber,
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  color: Colors.white,
                ),
              )
            ];
          },
          body: DefaultTabController(
            length: 3, // length of tabs
            initialIndex: 0,
            child: Scaffold(
              backgroundColor: Colors.amber,
              appBar: AppBar(
                backgroundColor: Colors.white,
                bottom: TabBar(
                    onTap: (int index) {},
                    isScrollable: true,
                    indicatorColor: brownGoldColor,
                    indicatorSize: TabBarIndicatorSize.label,
                    tabs: [
                      Tab(
                        child: Text(
                          "Description",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontFamily: 'avenirH'),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Specifications',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontFamily: 'avenirH'),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Reviews',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontFamily: 'avenirH'),
                        ),
                      ),
                    ]),
              ),
              body: Wrap(
                children: [
                  Container(
                    color: Colors.white,
                    child: DescriptionPage(),
                  ),
                ],
              ),
            ),
          ),
        ),
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
    final w5 = MediaQuery.of(context).size.width / 5;
    return Wrap(
      children: [
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                width: w5 * 4,
                child: Text(
                  'The ewers were used for washing hands and face\nin Ottoman culture, and their different forms\nwere used in the service of liquid drinks such as\nsherbet in the mansion, especially in the palace kitchen.',
                  style: TextStyle(
                      color: textGrey, fontSize: 14, fontFamily: 'avenirB'),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 21.5,
              ),
              Text(
                "Similar products",
                style: TextStyle(
                    color: Colors.black, fontFamily: 'avenirH', fontSize: 24),
              ),
              SizedBox(
                height: 27,
              ),
              rowItem(featuredName2, featuredPrice2, featuredImage2),
            ],
          ),
        ),
      ],
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
    final w5 = MediaQuery.of(context).size.width / 5;
    return Padding(
      padding: EdgeInsets.only(left: w * 0.08, right: w * 0.08),
      child: Wrap(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Case diameter"),
                  Text("Diameter: 20 cm Length: 40 cm"),
                ],
              ),
              Divider(
                height: 40,
                thickness: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Product Origin"),
                  Text("Turkey"),
                ],
              ),
              Divider(
                height: 40,
                thickness: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Production method"),
                  Text("100% handmade."),
                ],
              ),
              Divider(
                height: 40,
                thickness: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Material"),
                  Text("Gold and Glass crafting"),
                ],
              ),
              Divider(
                height: 40,
                thickness: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Strap color"),
                  Text("Gold Color"),
                ],
              ),
              SizedBox(
                height: 21.5,
              ),
              Text(
                "Similar products",
                style: TextStyle(
                    color: Colors.black, fontFamily: 'avenirH', fontSize: 24),
              ),
              SizedBox(
                height: 27,
              ),
              rowItem(featuredName2, featuredPrice2, featuredImage2),
            ],
          ),
        ],
      ),
    );
  }
}

class Reviews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(left: w * 0.08, right: w * 0.08),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 20),
            reviewComment(false, '', "Victor Flexin"),
            Divider(
              height: 40,
              thickness: 1,
            ),
            reviewComment(false, '', "Mike Flexin"),
            Divider(
              height: 40,
              thickness: 1,
            ),
            reviewComment(true, 'non.png', "Non Nonny"),
            SizedBox(
              height: 21.5,
            ),
            Text(
              "Similar products",
              style: TextStyle(
                  color: Colors.black, fontFamily: 'avenirH', fontSize: 24),
            ),
            SizedBox(
              height: 27,
            ),
            rowItem(featuredName2, featuredPrice2, featuredImage2),
          ],
        ),
      ),
    );
  }

  SizedBox rowItem(
      List<String> listName, List<String> listPrice, List<String> listIamge) {
    return SizedBox(
      height: 230,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: listName.length,
        itemBuilder: (context, index) {
          var ran = Random().nextInt(2);
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 4),
                child: Stack(
                  children: [
                    Image(
                      image: AssetImage('assets/image/${listIamge[index]}'),
                      width: 150,
                    ),
                    if (ran == 0)
                      Positioned(
                        right: 0,
                        top: 10,
                        child: Container(
                          decoration: new BoxDecoration(
                              color: brownGoldColor,
                              borderRadius: new BorderRadius.only(
                                bottomLeft: const Radius.circular(4),
                                topRight: const Radius.circular(4),
                              )),
                          padding: EdgeInsets.all(4),
                          child: Text(
                            "-${Random().nextInt(50) + 20}%",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'avenirB'),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.5,
              ),
              Text(
                listName[index],
                style: TextStyle(
                    color: Colors.black, fontSize: 14, fontFamily: 'avenirB'),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                listPrice[index],
                style: TextStyle(
                    color: Colors.black, fontSize: 24, fontFamily: 'avenirM'),
                textAlign: TextAlign.center,
              ),
            ],
          );
        },
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
                        width: 50.0,
                        height: 50.0,
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
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Colors.grey[200]
                          //Color(0xffF7F7F7)
                          ,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                            child: SvgPicture.asset(
                          'assets/icons/photo.svg',
                          width: 20,
                          height: 20,
                          color: Colors.black.withOpacity(0.3),
                        )),
                      ),
                SizedBox(
                  width: 18,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'avenirBl'),
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
                style: TextStyle(
                    color: Colors.black, fontSize: 12, fontFamily: 'avenirB'),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 21,
        ),
        Text(
          "The dial on this timepiece is extremely unique, as it is a concentric circular pattern that is covered by sturdy sapphire glass.",
          style: TextStyle(
            color: textGrey,
            fontSize: 14,
            fontFamily: 'avenirB',
          ),
        ),
        SizedBox(
          height: 19,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FlatButton(
              minWidth: 110,
              height: 36,
              color: Colors.grey[200].withOpacity(0.7),
              child: Text(
                "Helpful?",
                style: TextStyle(
                  color: textGrey,
                  fontSize: 14,
                  fontFamily: 'avenirB',
                ),
              ),
              onPressed: () {},
            ),
            GestureDetector(
              onTap: () {
                print("click");
              },
              child: Text("Report",
                  style: TextStyle(
                    color: brownGoldColor,
                    fontSize: 14,
                    fontFamily: 'avenirB',
                  )),
            )
          ],
        ),
      ],
    );
  }
}

SizedBox rowItem(
    List<String> listName, List<String> listPrice, List<String> listIamge) {
  return SizedBox(
    height: 230,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: listName.length,
      itemBuilder: (context, index) {
        var ran = Random().nextInt(2);
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 4),
              child: Stack(
                children: [
                  Image(
                    image: AssetImage('assets/image/${listIamge[index]}'),
                    width: 150,
                  ),
                  if (ran == 0)
                    Positioned(
                      right: 0,
                      top: 10,
                      child: Container(
                        decoration: new BoxDecoration(
                            color: brownGoldColor,
                            borderRadius: new BorderRadius.only(
                              bottomLeft: const Radius.circular(4),
                              topRight: const Radius.circular(4),
                            )),
                        padding: EdgeInsets.all(4),
                        child: Text(
                          "-${Random().nextInt(50) + 20}%",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'avenirB'),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(
              height: 10.5,
            ),
            Text(
              listName[index],
              style: TextStyle(
                  color: Colors.black, fontSize: 14, fontFamily: 'avenirB'),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              listPrice[index],
              style: TextStyle(
                  color: Colors.black, fontSize: 24, fontFamily: 'avenirM'),
              textAlign: TextAlign.center,
            ),
          ],
        );
      },
    ),
  );
}
