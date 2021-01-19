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
        
          children: [
            SizedBox(
              height: 44.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 1.sw * 0.08),
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
              padding: EdgeInsets.symmetric(horizontal: 1.sw * 0.08),
              child: Text("Find the perfect watch for your wrist",
                  style: b14,
                  textAlign: TextAlign.center),
            ),
            SizedBox(
              height: 27.5.h,
            ),
            rowSeeAll("Categories"),
            SizedBox(
              height: 10.h,
            ),
            rowItem(categoriesName,categoriesPrice,categoriesImage),
            SizedBox(
              height: 28.h,
            ),
            rowSeeAll("Top deals"),
            SizedBox(
              height: 230.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categoriesImage.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(left: 15.w),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 160.h,
                          width: 315.w,
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
                                EdgeInsets.only(left: 30.5.w, top: 23.5.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  width: 100.w,
                                  child: Text(
                                    "Gulcehre Ibrik",
                                    style: h20.copyWith(color: Colors.white),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                SizedBox(
                                  height: 6.h,
                                ),
                                Text(
                                  "W:32cm H:26cm",
                                  style: b14.copyWith(color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text(
                                  "€5650",
                                  style: h24.copyWith(color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          right: -20.w,
                          bottom: 0,
                          child: Image(
                            image:
                                AssetImage('assets/image/Gulcehre_ibrik.png'),
                            height: 220.h,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 28.h,
            ),
            rowSeeAll("Featured products"),
            SizedBox(
              height: 10.h,
            ),
            rowItem(featuredName,featuredPrice,featuredImage),
            SizedBox(
              height: 10.h,
            ),
            rowItem(featuredName2,featuredPrice2,featuredImage2),
            SizedBox(
              height: 28.h,
            ),
           rowSeeAll("Search by brand"),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              height: 150.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categoriesImage.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Column(
                      children: [
                        Image(
                          image: AssetImage(
                              'assets/image/${searchByImage[index]}'),
                         height: 122.h,
                        ),
                        SizedBox(
                          height: 10.5.h,
                        ),
                        Text(
                          searchByName[index],
                          style: b14.copyWith(color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 16.5.h,
            ),
          ],
        ),
      ),
    );
  }

  Padding rowSeeAll(String title) {
    return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style:h20,
                  textAlign: TextAlign.center,
                ),
                Row(
                  children: [
                    Text(
                      "See all",
                      style: b14.copyWith(color: brownGoldColor),
                      textAlign: TextAlign.center,
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
              ],
            ),
          );
  }
  SizedBox rowItem(List<String> listName,List<String> listPrice,List<String> listIamge) {
    return SizedBox(
            height: 230.h,
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

                        height: 150.h,
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
