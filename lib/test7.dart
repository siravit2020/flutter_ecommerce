/// Flutter code sample for BottomNavigationBar

// This example shows a [BottomNavigationBar] as it is used within a [Scaffold]
// widget. The [BottomNavigationBar] has three [BottomNavigationBarItem]
// widgets and the [currentIndex] is set to index 0. The selected item is
// amber. The `_onItemTapped` function changes the selected item's index
// and displays a corresponding message in the center of the [Scaffold].
//
// ![A scaffold with a bottom navigation bar containing three bottom navigation
// bar items. The first one is selected.](https://flutter.github.io/assets-for-api-docs/assets/material/bottom_navigation_bar.png)

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/color_plate.dart';
import 'package:flutter_ecommerce/intro_screen/intro_page.dart';
import 'package:flutter_ecommerce/loading_screen/loading_page.dart';
import 'package:flutter_ecommerce/login_screen/login_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    LoadingPage(),
    LoginPage(),
    Text(
      '3',
      style: optionStyle,
    ),
    Text(
      '4',
      style: optionStyle,
    ),
    Text(
      '5',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Sample'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
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
            label: 'Home',
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
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
