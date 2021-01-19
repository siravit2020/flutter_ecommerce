import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/global_widgets/global_widgets.dart';
import 'package:flutter_ecommerce/text_style.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../color_plate.dart';
import '../../constants.dart';
import '../riverpod_main.dart';

final changePageState = StateProvider<int>((ref) {
  return 0;
});

class CategoriesPage extends ConsumerWidget {
  static List<Widget> _widgetList = <Widget>[
    MainPage(),
    SeeAllPage(),
  ];
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final height = MediaQuery.of(context).size.height -
        kToolbarHeight -
        MediaQuery.of(context).padding.top;
    final changePage = watch(changePageState);

    return Container(
      width: double.infinity,
      constraints: new BoxConstraints(
        minHeight: height,
      ),
      decoration: whiteCorner,
      child: SingleChildScrollView(
        child: _widgetList[changePage.state],
      ),
    );
  }
}

class MainPage extends ConsumerWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final w5 = 1.sw / 5;
    final changePage = watch(changePageState);
    final titleAppbar = watch(titleAppbarState);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 44,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 1.sw * 0.08),
          child: Text(
            "Ottoman Collection Classic Collections",
            style: TextStyle(
                color: Colors.black, fontSize: 30, fontFamily: 'avenirH'),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 11.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 1.sw * 0.08),
          child: Text("Search through more than 1000+ watches",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: 'avenirB',
              ),
              textAlign: TextAlign.center),
        ),
        SizedBox(
          height: 24.h,
        ),
        rowSeeAll("Limited Edition", w5, changePage, titleAppbar),
        SizedBox(
          height: 10.h,
        ),
        rowItem(categoriesName, categoriesPrice, categoriesImage),
        SizedBox(
          height: 28.h,
        ),
        rowSeeAll(
            "Anatolian Civilizations Catalog", w5, changePage, titleAppbar),
        SizedBox(
          height: 10.h,
        ),
        rowItem(featuredName, featuredPrice, featuredImage),
        SizedBox(
          height: 28.h,
        ),
        rowSeeAll("Zevk-i Selim Catalog", w5, changePage, titleAppbar),
        SizedBox(
          height: 10.h,
        ),
        rowItem(featuredName2, featuredPrice2, featuredImage2),
        SizedBox(
          height: 16.5.h,
        ),
      ],
    );
  }

  Padding rowSeeAll(String title, double w5, StateController<int> changePage,
      StateController<String> appBarTitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: w5 * 4,
              ),
              child: Text(
                title,
                style: h20,
                textAlign: TextAlign.start,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              changePage.state = 1;
              appBarTitle.state = title.toUpperCase();
              print("click");
            },
            child: Row(
              children: [
                Text(
                  "See all",
                  style: b14.copyWith(color: brownGoldColor),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  width: 4.3.w,
                ),
                SvgPicture.asset(
                  'assets/icons/doubleArrows.svg',
                  width: 5.67,
                  color: brownGoldColor,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  SizedBox rowItem(
      List<String> listName, List<String> listPrice, List<String> listIamge) {
    return SizedBox(
      height: 230.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoriesImage.length,
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
                      height: 150.h,
                    ),
                    if (ran == 0)
                      Positioned(
                        right: 0,
                        top: 10.h,
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
                            style: b12.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    if (ran == 0)
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: SvgPicture.asset(
                          'assets/icons/Icons-icon-added-to-fav.svg',
                          width: 28.w,
                        ),
                      )
                  ],
                ),
              ),
              SizedBox(
                height: 10.5.h,
              ),
              Text(
                listName[index],
                style: b14.copyWith(color: Colors.black),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                listPrice[index],
                style: h20,
                textAlign: TextAlign.center,
              ),
            ],
          );
        },
      ),
    );
  }
}

class SeeAllPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final w = MediaQuery.of(context).size.width;
    final w5 = MediaQuery.of(context).size.width / 5;
    final changePage = watch(changePageState);
    final titleAppbar = watch(titleAppbarState);
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 44.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.08),
              child: Text(
                "Add a Signature\nto Your Look",
                style: h30,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.08),
              child: Text("The latest styles of men's leather watches",
                  style: b14, textAlign: TextAlign.center),
            ),
            SizedBox(
              height: 16.h,
            ),
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: collection.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 211.w / 250.h,
              ),
              itemBuilder: (BuildContext context, int index) {
                var ran = Random().nextInt(2);
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Image(
                          image: AssetImage(
                              'assets/image/${collection[index].image}'),
                          height: 150.h,
                        ),
                        if (ran == 0)
                          Positioned(
                            right: 0,
                            top: 10.h,
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
                                style: b12.copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                        if (ran == 0)
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: SvgPicture.asset(
                              'assets/icons/Icons-icon-added-to-fav.svg',
                              width: 28.w,
                            ),
                          )
                      ],
                    ),
                    SizedBox(
                      height: 10.5.h,
                    ),
                    Text(
                      collection[index].name,
                      style: b14.copyWith(color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      collection[index].price,
                      style: m24,
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              },
            ),
            SizedBox(
              height: 57.h,
            ),
            ButtonFill(
              message: "LOAD COLLECTION",
              color: brownGoldColor,
              fuction: () {},
              width: w5 * 3,
            ),
            SizedBox(
              height: 41.5.h,
            ),
          ],
        ),
        Positioned(
          top: 10.h,
          left: 10.w,
          child: Material(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(100))),
            color: Colors.transparent,
            child: IconButton(
              color: Colors.grey.withOpacity(0.5),
              splashRadius: 20,
              onPressed: () {
                changePage.state = 0;
                titleAppbar.state = "CATEGORIES";
              },
              splashColor: brownGoldColor.withOpacity(0.4),
              highlightColor: Colors.transparent,
              icon: Icon(Icons.arrow_back),
            ),
          ),
        )
      ],
    );
  }
}
