import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/color_plate.dart';
import 'package:flutter_ecommerce/main_screen/widgets/star.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'constants.dart';

class MoreDetails3 extends StatefulWidget {
  @override
  _MoreDetails3State createState() => _MoreDetails3State();
}

GlobalKey stickyKey = GlobalKey();

class _MoreDetails3State extends State<MoreDetails3>
    with SingleTickerProviderStateMixin {
  List<double> y = [450, 650, 1000];
  int i = 0;
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 3);

    tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    i = tabController.index;
    setState(() {});
  }

  @override
  void dispose() {
    tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          DefaultTabController(
            length: 3, // length of tabs
            initialIndex: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Color(0xffE4E4E7),
                                width: 2.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      TabBar(
                          controller: tabController,
                          onTap: (int index) {
                            i = index;
                          },
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
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      color: Colors.white,
                      height: 1.sh/2,
                      child: TabBarView(
                        controller: tabController,
                        children: [
                          Center(child: DescriptionPage()),
                          Center(child: SpecificationsPage()),
                          Center(child: Reviews()),
                        ],
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
              ],
            ),
          ),
        ],
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
    return Center(
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
          
        ],
      ),
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
           
          ],
        ),
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
