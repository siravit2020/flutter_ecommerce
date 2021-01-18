import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/global_widgets/global_widgets.dart';
import 'package:flutter_ecommerce/text_style.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../color_plate.dart';
import '../../constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class StorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final w = 1.sw;
    final height = MediaQuery.of(context).size.height - kToolbarHeight;
    return Container(
      width: double.infinity,
      constraints: new BoxConstraints(
        minHeight: height,
      ),
      decoration: whiteCorner,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 44,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.08),
              child: Text(
                "Ottoman Collection",
                style: h30,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.08),
              child: Text("Find the perfect watch for your wrist",
                  style: b14,
                  textAlign: TextAlign.center),
            ),
            SizedBox(
              height: 27.5,
            ),
            rowSeeAll("Limited Edition"),
            SizedBox(
              height: 10,
            ),
            rowItem(categoriesName,categoriesPrice,categoriesImage),
            SizedBox(
              height: 28,
            ),
            rowSeeAll("Top deals"),
            SizedBox(
              height: 230,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categoriesImage.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 160,
                          width: 315,
                          decoration: BoxDecoration(
                            borderRadius:
                                new BorderRadius.all(Radius.circular(4)),
                            gradient: LinearGradient(
                                begin: Alignment.bottomRight,
                                end: Alignment.topLeft,
                                colors: [
                                  Color(0xff272833),
                                  Color(0xff97571E),
                                ]),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 30.5, top: 23.5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  width: 100,
                                  child: Text(
                                    "Gulcehre Ibrik",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontFamily: 'avenirH'),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  "W:32cm H:26cm",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontFamily: 'avenirB'),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "€5650",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontFamily: 'avenirH'),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          right: -20,
                          bottom: 0,
                          child: Image(
                            image:
                                AssetImage('assets/image/Gulcehre_ibrik.png'),
                            width: 220,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 28,
            ),
            rowSeeAll("Featured products"),
            SizedBox(
              height: 10,
            ),
            rowItem(featuredName,featuredPrice,featuredImage),
            SizedBox(
              height: 10,
            ),
            rowItem(featuredName2,featuredPrice2,featuredImage2),
            SizedBox(
              height: 28,
            ),
           rowSeeAll("Search by brand"),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 130,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categoriesImage.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Image(
                          image: AssetImage(
                              'assets/image/${searchByImage[index]}'),
                          width: 122,
                        ),
                        SizedBox(
                          height: 10.5,
                        ),
                        Text(
                          searchByName[index],
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'avenirB'),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }

  Padding rowSeeAll(String title) {
    return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'avenirH'),
                  textAlign: TextAlign.center,
                ),
                Row(
                  children: [
                    Text(
                      "See all",
                      style: TextStyle(
                          color: brownGoldColor,
                          fontSize: 14,
                          fontFamily: 'avenirB'),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      width: 4.3,
                    ),
                    SvgPicture.asset(
                      'assets/icons/doubleArrows.svg',
                      width: 5.67,
                      color: brownGoldColor,
                    )
                  ],
                ),
              ],
            ),
          );
  }
  SizedBox rowItem(List<String> listName,List<String> listPrice,List<String> listIamge) {
    return SizedBox(
            height: 230,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categoriesImage.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: (){Navigator.pushNamed(context, '/detail');},
                      child: Image(
                        image: AssetImage(
                            'assets/image/${listIamge[index]}'),
                        width: 150,
                      ),
                    ),
                    SizedBox(
                      height: 10.5,
                    ),
                    Text(
                      listName[index],
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'avenirB'),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      listPrice[index],
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontFamily: 'avenirM'),
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              },
            ),
          );
  }
}
