// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_ecommerce/color_plate.dart';
// import 'package:flutter_ecommerce/constants.dart';
// import 'package:flutter_ecommerce/global_widgets/global_widgets.dart';
// import 'package:flutter_ecommerce/text_style.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import 'loading_screen/loading_page.dart';

// enum SingingCharacter { lafayette, jefferson }

// final _characterState = StateProvider<SingingCharacter>((ref) {
//   return SingingCharacter.lafayette;
// });
// final _radioState = ChangeNotifierProvider<RadioChange>((ref) {
//   return RadioChange();
// });

// class RadioChange extends ChangeNotifier {
//   List<bool> radio = [false, false, false];
//   int index;
//   void select(int index) {
//     this.index = index;
//     radio = [false, false, false];
//     radio[index] = true;
//     notifyListeners();
//   }
// }

// class OrderDetail extends ConsumerWidget {
//   const OrderDetail({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context, ScopedReader watch) {
//     final w = MediaQuery.of(context).size.width;
//     final w5 = MediaQuery.of(context).size.width / 5;
//     final height = MediaQuery.of(context).size.height - kToolbarHeight;

//     final radio = watch(_radioState);
//     return SafeArea(
//       child: Scaffold(
//           backgroundColor: Colors.black,
//           appBar: StandardAppbar(
//             title: "MY ADDRESS",
//           ),
//           body: Container(
//             width: double.infinity,
//             constraints: new BoxConstraints(
//               minHeight: height,
//             ),
//             decoration: whiteCorner,
//             child: Stack(
//               children: [
//                 SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: w * 0.08),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisSize: MainAxisSize.max,
//                           children: [
//                             SizedBox(
//                               height: 41.h,
//                             ),
//                             detailsOrder("SHIPPING TO",
//                                 "Dereboyu Cad. 23, \n34410 - Istanbul/Türkiye"),
//                             Divider(
//                               thickness: 1,
//                               height: 62.h,
//                             ),
//                             detailsOrder("PAY WITH CREDIT CARD",
//                                 "XXXX - XXXX - XXXX - 9123"),
//                             Divider(
//                               thickness: 1,
//                               height: 62.h,
//                             ),
//                             Text(
//                               "ORDER DETAILS",
//                               style: b14,
//                             ),
//                             SizedBox(
//                               height: 3,
//                             ),
//                             for (var item in collection2)
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
//                                   Image(
//                                     image: AssetImage(
//                                         'assets/image/${item.image}'),
//                                     height: 90.h,
//                                   ),
//                                   Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         item.name,
//                                         style:
//                                             b14.copyWith(color: Colors.black),
//                                       ),
//                                       SizedBox(
//                                         height: 8,
//                                       ),
//                                       Text(
//                                         item.price,
//                                         style: h20,
//                                       ),
//                                     ],
//                                   )
//                                 ],
//                               ),
//                             Divider(
//                               thickness: 1,
//                               height: 62.h,
//                             ),
//                             Text(
//                               "SHIPPING METHOD",
//                               style: b14,
//                             ),
//                             SizedBox(
//                               height: 22,
//                             ),
//                             rowRadio(radio, 0, method[0].method,
//                                 method[0].price, brownGoldColor),
//                             SizedBox(
//                               height: 16.h,
//                             ),
//                             rowRadio(radio, 1, method[1].method,
//                                 method[1].price, Colors.black),
//                             SizedBox(
//                               height: 16.h,
//                             ),
//                             rowRadio(radio, 2, method[2].method,
//                                 method[2].price, Colors.black),
//                             SizedBox(
//                               height: 41.h,
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         decoration: BoxDecoration(
//                           color: Colors.black,
//                           borderRadius: BorderRadius.only(
//                             topLeft: const Radius.circular(20.0),
//                             topRight: const Radius.circular(20.0),
//                           ),
//                         ),
//                         child: SizedBox(
//                           width: double.infinity,
//                           child: Padding(
//                             padding: EdgeInsets.symmetric(horizontal: w * 0.08),
//                             child: Column(
//                               children: [
//                                 SizedBox(
//                                   height: 31.h,
//                                 ),
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(
//                                       "SUBTOTAL",
//                                       style: b14.copyWith(color: Colors.white),
//                                     ),
//                                     Text(
//                                       "€13.650",
//                                       style: b14.copyWith(color: Colors.white),
//                                     ),
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   height: 16.h,
//                                 ),
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(
//                                       "SHIPPING",
//                                       style: b14.copyWith(color: Colors.white),
//                                     ),
//                                     Text(
//                                       (!radio.radio[0] &&
//                                               !radio.radio[1] &&
//                                               !radio.radio[2])
//                                           ? "Please select"
//                                           : method[radio.index].price,
//                                       style: TextStyle(
//                                         fontSize: 14.sp,
//                                         fontFamily: 'avenirBl',
//                                         color: (!radio.radio[0] &&
//                                                 !radio.radio[1] &&
//                                                 !radio.radio[2])
//                                             ? Colors.white.withOpacity(0.5)
//                                             : Colors.white,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   height: 35.h,
//                                 ),
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(
//                                       "Total to Pay",
//                                       style: h20.copyWith(color: Colors.white),
//                                     ),
//                                     Text(
//                                       "€13.650",
//                                       style: h20.copyWith(color: Colors.white),
//                                     ),
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   height: 22.h,
//                                 ),
//                                 ButtonFill(
//                                   color: brownGoldColor,
//                                   fuction: () {
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) => LoadingPage(
//                                           nextPage: '/ordersuccess',
//                                         ),
//                                       ),
//                                     );
//                                   },
//                                   message: "PLACE ORDER",
//                                   width: w5 * 3,
//                                 ),
//                                 SizedBox(
//                                   height: 16.5.h,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           )),
//     );
//   }

//   Row rowRadio(
//       RadioChange radio, int index, String title, String price, Color color) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Row(
//           children: [
//             GestureDetector(
//               onTap: () {
//                 radio.select(index);
//               },
//               child: Container(
//                 height: 20,
//                 width: 20,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   border: Border.all(
//                     color: Color(0xffD2D2D6),
//                   ),
//                 ),
//                 child: Center(
//                   child: Container(
//                     height: 12,
//                     width: 12,
//                     decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: (radio.radio[index])
//                             ? brownGoldColor
//                             : Colors.white),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               width: 10.w,
//             ),
//             Text(
//               title,
//               style: b14.copyWith(color: Colors.black),
//             ),
//           ],
//         ),
//         Text(
//           price,
//           style: TextStyle(
//             fontSize: 14.sp,
//             fontFamily: 'avenirB',
//             color: color,
//           ),
//         ),
//       ],
//     );
//   }

//   Column detailsOrder(String title, String address) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               title,
//               style: b14,
//             ),
//             Text(
//               "Change",
//               style: TextStyle(
//                 fontSize: 14,
//                 fontFamily: 'avenirB',
//                 color: brownGoldColor,
//               ),
//             ),
//           ],
//         ),
//         SizedBox(
//           height: 24.h,
//         ),
//         Container(
//           width: 200.w,
//           child: Text(
//             address,
//             style: TextStyle(
//               height: 1.4,
//               fontSize: 14.sp,
//               fontFamily: 'avenirB',
//               color: Colors.black,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecommerce/color_plate.dart';
import 'package:flutter_ecommerce/constants.dart';
import 'package:flutter_ecommerce/global_widgets/global_widgets.dart';
import 'package:flutter_ecommerce/text_style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'loading_screen/loading_page.dart';

enum SingingCharacter { lafayette, jefferson }

final _radioState = ChangeNotifierProvider<RadioChange>((ref) {
  return RadioChange();
});

class RadioChange extends ChangeNotifier {
  List<bool> radio = [false, false, false];
  int index;
  void select(int index) {
    this.index = index;
    radio = [false, false, false];
    radio[index] = true;
    notifyListeners();
  }
}

final shippingState = StateProvider<List<String>>((ref) {
  return null;
});
final paymentState = StateProvider<List<String>>((ref) {
  return null;
});

class OrderDetail extends ConsumerWidget {
  const OrderDetail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final w = MediaQuery.of(context).size.width;
    final w5 = MediaQuery.of(context).size.width / 5;
    final height = MediaQuery.of(context).size.height - kToolbarHeight;
    final shipping = watch(shippingState);
    final payment = watch(paymentState);
    final radio = watch(_radioState);
    return Container(
      width: double.infinity,
      constraints: new BoxConstraints(
        minHeight: height,
      ),
      decoration: whiteCorner,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.08),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: 41.h,
                  ),
                  detailsOrder(
                      "SHIPPING TO",
                      "Dereboyu Cad. 23, \n34410 - Istanbul/Türkiye",
                      shipping,
                      true,
                      context),
                  Divider(
                    thickness: 1,
                    height: 62.h,
                  ),
                  detailsOrder(
                      "PAY WITH CREDIT CARD",
                      "XXXX - XXXX - XXXX - 9123",
                      payment,
                      false,
                      context),
                  Divider(
                    thickness: 1,
                    height: 62.h,
                  ),
                  Text(
                    "ORDER DETAILS",
                    style: b14,
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  for (var item in collection2)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image(
                          image: AssetImage('assets/image/${item.image}'),
                          height: 90.h,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.name,
                              style: b14.copyWith(color: Colors.black),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              item.price,
                              style: h20,
                            ),
                          ],
                        )
                      ],
                    ),
                  Divider(
                    thickness: 1,
                    height: 62.h,
                  ),
                  Text(
                    "SHIPPING METHOD",
                    style: b14,
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  rowRadio(radio, 0, method[0].method, method[0].price,
                      brownGoldColor),
                  SizedBox(
                    height: 16.h,
                  ),
                  rowRadio(radio, 1, method[1].method, method[1].price,
                      Colors.black),
                  SizedBox(
                    height: 16.h,
                  ),
                  rowRadio(radio, 2, method[2].method, method[2].price,
                      Colors.black),
                  SizedBox(
                    height: 41.h,
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(20.0),
                  topRight: const Radius.circular(20.0),
                ),
              ),
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.08),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 31.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "SUBTOTAL",
                            style: b14.copyWith(color: Colors.white),
                          ),
                          Text(
                            "€13.650",
                            style: b14.copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "SHIPPING",
                            style: b14.copyWith(color: Colors.white),
                          ),
                          Text(
                            (!radio.radio[0] &&
                                    !radio.radio[1] &&
                                    !radio.radio[2])
                                ? "Please select"
                                : method[radio.index].price,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: 'avenirBl',
                              color: (!radio.radio[0] &&
                                      !radio.radio[1] &&
                                      !radio.radio[2])
                                  ? Colors.white.withOpacity(0.5)
                                  : Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 35.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total to Pay",
                            style: h20.copyWith(color: Colors.white),
                          ),
                          Text(
                            "€13.650",
                            style: h20.copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 22.h,
                      ),
                      ButtonFill(
                        color: brownGoldColor,
                        fuction: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoadingPage(
                                nextPage: '/ordersuccess',
                              ),
                            ),
                          );
                        },
                        message: "PLACE ORDER",
                        width: w5 * 3,
                      ),
                      SizedBox(
                        height: 16.5.h,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Row rowRadio(
      RadioChange radio, int index, String title, String price, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                radio.select(index);
              },
              child: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Color(0xffD2D2D6),
                  ),
                ),
                child: Center(
                  child: Container(
                    height: 12,
                    width: 12,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (radio.radio[index])
                            ? brownGoldColor
                            : Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              title,
              style: b14.copyWith(color: Colors.black),
            ),
          ],
        ),
        Text(
          price,
          style: TextStyle(
            fontSize: 14.sp,
            fontFamily: 'avenirB',
            color: color,
          ),
        ),
      ],
    );
  }

  Column detailsOrder(String title, String address, StateController<List<String>> text,
      bool type, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: b14,
            ),
            GestureDetector(
              onTap: () {
                if (text.state == null) {
                  if (type) {
                    Navigator.pushNamed(context, '/shipping');
                    
                  } else
                    Navigator.pushNamed(context, '/payment');
                    text.state = ['dd'];
                }else{
                  if (type) 
                    Navigator.pushNamed(context, '/myaddress');
                    
                   else
                    Navigator.pushNamed(context, '/mycard');
                }
              },
              child: Text(
                (text.state == null) ? "Add" : "Change",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'avenirB',
                  color: brownGoldColor,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 24.h,
        ),
        (text.state == null)
            ? Text(
                type
                    ? "Please update your address"
                    : "Please update your payment",
                style: b14)
            : Container(
                width: 200.w,
                child: Text(
                  address,
                  style: TextStyle(
                    height: 1.4,
                    fontSize: 14.sp,
                    fontFamily: 'avenirB',
                    color: Colors.black,
                  ),
                ),
              ),
      ],
    );
  }
}
