import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/global_widgets/global_widgets.dart';
import 'package:flutter_ecommerce/main_screen/categories/categories_page.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants.dart';
import '../riverpod_main.dart';


final selectedTrashState = StateProvider<bool>((ref) {
  return false;
});

class FavoritesPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final w = MediaQuery.of(context).size.width;
    final w5 = MediaQuery.of(context).size.width / 5;
    final changePage = watch(changePageState);
    final titleAppbar = watch(titleAppbarState);
    final height = MediaQuery.of(context).size.height -
        kToolbarHeight -
        MediaQuery.of(context).padding.top;
    final selectedTrash = watch(selectedTrashState);
    return Container(
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
      child: Container(
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
                "Products \nyou might like",
                style: TextStyle(
                    color: Colors.black, fontSize: 30, fontFamily: 'avenirH'),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 27.5,
            ),
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: collection.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: w / 2 / 230,
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
                          width: 150,
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: SvgPicture.asset(
                            (selectedTrash.state) ? 
                            'assets/icons/trashRed.svg'
                            : 'assets/icons/trashRed.svg',
                            width: 28,
                            height: 28,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.5,
                    ),
                    Text(
                      collection[index].name,
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
                      collection[index].price,
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
            SizedBox(
              height: 47,
            ),
          ],
        ),
      ),
    );
  }
}
