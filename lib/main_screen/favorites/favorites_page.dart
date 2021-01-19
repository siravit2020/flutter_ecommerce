import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/global_widgets/global_widgets.dart';
import 'package:flutter_ecommerce/main_screen/categories/categories_page.dart';
import 'package:flutter_ecommerce/text_style.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants.dart';
import '../riverpod_main.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class FavoritesPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final w = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height -
        kToolbarHeight -
        MediaQuery.of(context).padding.top;
    final action = watch(actionAbbbarFav);
    return Container(
      width: double.infinity,
      constraints: new BoxConstraints(
        minHeight: height,
      ),
      decoration: whiteCorner,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 43.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.08),
              child: Text(
                "Products \n you might like",
                style: h30,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 27.5.h,
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
               
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Image(
                          image: AssetImage(
                              'assets/image/${collection[index].image}'),
                          width: 150.h,
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: SvgPicture.asset(
                            (action.state) ? 
                            'assets/icons/trashRed.svg'
                            : 'assets/icons/Icons-icon-added-to-fav.svg',
                            width: 28,
                            height: 28,
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
                      height: 5,
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
              height: 47,
            ),
          ],
        ),
      ),
    );
  }
}
