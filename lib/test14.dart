import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'color_plate.dart';
import 'main_screen/widgets/star.dart';

class Test14 extends StatefulWidget {
  @override
  _Test14State createState() => _Test14State();
}

class _Test14State extends State<Test14> with SingleTickerProviderStateMixin {
  final bodyGlobalKey = GlobalKey();
  final List<Widget> myTabs = [
    Tab(text: 'auto short'),
    Tab(text: 'auto long'),
    Tab(text: 'fixed'),
  ];
  TabController _tabController;
  ScrollController _scrollController;
  bool fixedScroll;

  Widget _buildCarousel() {
    return Stack(
      children: <Widget>[
        Placeholder(fallbackHeight: 100),
        Positioned.fill(
            child: Align(alignment: Alignment.center, child: Text('Slider'))),
      ],
    );
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_smoothScrollToTop);

    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  _scrollListener() {
    if (fixedScroll) {
      _scrollController.jumpTo(0);
    }
  }

  _smoothScrollToTop() {
    _scrollController.animateTo(
      0,
      duration: Duration(microseconds: 300),
      curve: Curves.ease,
    );

    setState(() {
      fixedScroll = _tabController.index == 2;
    });
  }

  _buildTabContext(int lineCount) => Container(
        child: ListView.builder(
          physics: const ClampingScrollPhysics(),
          itemCount: lineCount,
          itemBuilder: (BuildContext context, int index) {
            return Text('some content');
          },
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (context, value) {
          return [
            SliverToBoxAdapter(child: _buildCarousel()),
            SliverToBoxAdapter(
              child: TabBar(
                  controller: _tabController,
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
          ];
        },
        body: Container(
            color: Colors.red,
          child: TabBarView(
            controller: _tabController,
            children:
                // [
                //   DescriptionPage(),
                //   SpecificationsPage(),
                //   Reviews(),
                // ],
                [
              _buildTabContext(2),
              _buildTabContext(200),
              _buildTabContext(2)
            ],
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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 20,
        ),
        Container(
          width: w5 * 4,
          child: Text(
            'The ewers were used for washing hands and face\nin Ottoman culture, and their different forms\nwere used in the service of liquid drinks such as\nsherbet in the mansion, especially in the palace kitchen.',
            style:
                TextStyle(color: textGrey, fontSize: 14, fontFamily: 'avenirB'),
            textAlign: TextAlign.center,
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
      child: Column(
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 20),
          reviewComment(false, '', "Victor Flexin"),
          SizedBox(height: 20),
          reviewComment(false, '', "Mike Flexin"),
          SizedBox(height: 20),
          reviewComment(true, 'non.png', "Non Nonny"),
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
