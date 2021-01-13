import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/color_plate.dart';
import 'package:flutter_ecommerce/global_widgets/global_widgets.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width / 5;
    return Column(
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "HISTORY CULTRUE GLASS",
                  style: TextStyle(
                      color: Colors.white, fontSize: 13, fontFamily: 'avenirB'),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Hagia Sophia \n Deesis Mosaic Vase",
                  style: TextStyle(
                      color: Colors.white, fontSize: 40, fontFamily: 'avenirH'),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 9.5,
                ),
                Text(
                  "€3450",
                  style: TextStyle(
                      color: Colors.white, fontSize: 20, fontFamily: 'avenirH'),
                ),
                Image(
                  image: AssetImage('assets/image/SoteriaVazo.png'),
                  width: w * 4.8,
                ),
              ],
            ),
          ),
        ),
       ButtonFill(
          width: w * 3,
          color: goldColor,
          message: "MASTER BUTTON",
          fuction: () {
            
          },
        ),
        SizedBox(
          height: 16.5,
        ),
      ],
    );
  }
}
