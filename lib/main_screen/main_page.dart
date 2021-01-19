import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecommerce/color_plate.dart';
import 'package:flutter_ecommerce/loading_screen/loading_page.dart';
import 'package:flutter_ecommerce/login_screen/login_page.dart';

import 'package:flutter_ecommerce/seach_and_hastag/hastag.dart';
import 'package:flutter_ecommerce/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants.dart';
import 'categories/categories_page.dart';
import 'favorites/favorites_page.dart';
import 'riverpod_main.dart';
import 'setting/setting_main.dart';
import 'store/store_page.dart';

List<String> title = [
  'STORE',
  'CATEGORIES',
  'SHIPPING ADDRESS',
  'FAVORITES',
  'SETTING'
];

final selectedIndexState = StateProvider<int>((ref) {
  return 0;
});

class MainPageState extends ConsumerWidget {
  static List<Widget> _widgetOptions = <Widget>[
    StorePage(),
    CategoriesPage(),
    Container(
      color: Colors.white,
      height: 800,
    ),
    FavoritesPage(),
    SettingMain()
  ];

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final selectedIndex = watch(selectedIndexState);
    final action = watch(actionAbbbarFav);
    final titleAppbar = watch(titleAppbarState);
    pTop = MediaQuery.of(context).padding.top + kToolbarHeight;
    pBottom = kBottomNavigationBarHeight;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: true,
            floating: false,
            pinned: true,
            snap: false,
            expandedHeight:
                (selectedIndex.state == 3 || selectedIndex.state == 2)
                    ? 140.h
                    : 0,
            flexibleSpace:
                (selectedIndex.state == 3 || selectedIndex.state == 2)
                    ? FlexibleSpaceBar(
                        background: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 20.h,
                                left: 1.sw * 0.08,
                                right: 1.sw * 0.08),
                            child: case2(
                                selectedIndex.state,
                                {
                                  2: Text(
                                      "Fill in the form below so we can know exactly \n where to ship your order.",
                                      textAlign: TextAlign.center,
                                      style: b14),
                                  3: Text(
                                      (action.state)
                                          ? "To remove an item, simply tap on the icon on the bottom right corner of the product."
                                          : "Seems like you don’t have any items \n in your favorite list.",
                                      textAlign: TextAlign.center,
                                      style: b14),
                                },
                                Text("Default")),
                          ),
                        ),
                      )
                    : SizedBox(),
            leading: IconButton(
              splashRadius: 20,
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/icons/menu.svg',
                color: Colors.white,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 4),
                child: case2(
                    selectedIndex.state,
                    {
                      3: IconButton(
                        splashRadius: 20,
                        color: Colors.white,
                        onPressed: () {
                          action.state = !action.state;
                        },
                        icon: SvgPicture.asset(
                          (!action.state)
                              ? 'assets/icons/trashOut.svg'
                              : 'assets/icons/close.svg',
                          color: Colors.white,
                        ),
                      ),
                      2: newMethod(action,context),
                    },
                    Row(
                      children: [
                        IconButton(
                          splashRadius: 20,
                          onPressed: () {
                            Navigator.pushNamed(context, '/hastag');
                          },
                          icon: SvgPicture.asset(
                            'assets/icons/filter.svg',
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          splashRadius: 20,
                          onPressed: () {
                            Navigator.pushNamed(context, '/search');
                          },
                          icon: SvgPicture.asset(
                            'assets/icons/search.svg',
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )),
              ),
            ],
            backgroundColor: Colors.black,
            title: Text(
              titleAppbar.state,
              style: b13.copyWith(color: Colors.white),
            ),
          ),
          SliverToBoxAdapter(
            child: _widgetOptions.elementAt(selectedIndex.state),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 4,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              'assets/icons/icon-home.svg',
              color: brownGoldColor,
            ),
            icon: SvgPicture.asset(
              'assets/icons/icon-home.svg',
              color: Colors.black,
            ),
            label: 'Stroe',
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              'assets/icons/icon-categories.svg',
              color: brownGoldColor,
            ),
            icon: SvgPicture.asset(
              'assets/icons/icon-categories.svg',
              color: Colors.black,
            ),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              'assets/icons/icon-shopping-bag.svg',
              color: brownGoldColor,
            ),
            icon: SvgPicture.asset(
              'assets/icons/icon-shopping-bag.svg',
              color: Colors.black,
            ),
            label: 'Shopping',
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              'assets/icons/icon-bookmark.svg',
              color: brownGoldColor,
            ),
            icon: SvgPicture.asset(
              'assets/icons/icon-bookmark.svg',
              color: Colors.black,
            ),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              'assets/icons/icon-settings.svg',
              color: brownGoldColor,
            ),
            icon: SvgPicture.asset(
              'assets/icons/icon-settings.svg',
              color: Colors.black,
            ),
            label: 'Setting',
          ),
        ],
        currentIndex: selectedIndex.state,
        selectedItemColor: Colors.amber[800],
        onTap: (int index) {
          selectedIndex.state = index;
          titleAppbar.state = title[index];
        },
      ),
    ));
  }

  Container newMethod(StateController<bool> action,BuildContext context) {
    return Container(
      child: Center(
        child: Stack(
          children: [
            IconButton(
              splashRadius: 20,
              color: Colors.white,
              onPressed: () {
                 Navigator.pushNamed(context, '/orderdetail');
              },
              icon: SvgPicture.asset(
                'assets/icons/shopingOut.svg',
                color: Colors.white,
                width: 20,
                height: 20,
              ),
            ),
            Positioned(
              bottom: 7,
              right: 8,
              child: Container(
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                    color: brownGoldColor, shape: BoxShape.circle),
                child: Center(
                  child: Text(
                    "8",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.sp,
                      fontFamily: 'avenirM',
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

TValue case2<TOptionType, TValue>(
  TOptionType selectedOption,
  Map<TOptionType, TValue> branches, [
  TValue defaultValue = null,
]) {
  if (!branches.containsKey(selectedOption)) {
    return defaultValue;
  }

  return branches[selectedOption];
}
