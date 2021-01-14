
import 'package:flutter/material.dart';

class Amenities extends StatelessWidget {
  final String titleTop;
  final String textDes;
  final String img;

  Amenities(this.titleTop, this.textDes, this.img);

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      key: scaffoldKey,
     
      body: Container(
        color: Color.fromRGBO(216, 216, 216, 1),
        child: Stack(
          // overflow: Overflow.visible,
          children: <Widget>[
            Image.asset(
              "$img",
              height: 400,
              width: screenSize.width,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 50.0,
              left: 10.0,
              child: GestureDetector(
                onTap: () {
                 
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 30.0,
                ),
              ),
            ),
            Positioned(
              top: 50.0,
              right: 10.0,
              child: GestureDetector(
                  onTap: () => scaffoldKey.currentState.openDrawer(),
                  child: Icon(
                    Icons.menu,
                    color: Colors.white,
                    size: 30.0,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: DraggableScrollableSheet(
                  initialChildSize: 0.5,
                  minChildSize: 0.5,
                  maxChildSize: 0.8,
                  builder: (context, controller) {
                    return SingleChildScrollView(
                      controller: controller,
                      child: Container(
                        width: screenSize.width,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(216, 216, 216, 1),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(25.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                titleTop,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 26.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 40.0,
                              ),
                              Text(
                                'Description',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(50, 54, 67, 1),
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                textDes,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Color.fromRGBO(117, 117, 117, 1),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}