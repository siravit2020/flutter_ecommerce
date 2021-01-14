import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/more_detail.dart';

import 'color_plate.dart';

class Test13 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 20.0),
              DefaultTabController(
                length: 3, // length of tabs
                initialIndex: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      child: TabBar(
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
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: 105.0,
                        maxHeight: 600.0,
                      ),
                      child: TabBarView(
                        children: [
                          DescriptionPage(),
                          SpecificationsPage(),
                          Reviews(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
