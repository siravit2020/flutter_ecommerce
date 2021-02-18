import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const List<String> searchByName = [
  '"İnandık" Vase',
  '"Devr-i Alem" Flask',
  '"Soteria" Vase',
];
const List<String> searchByImage = [
  'Photo.png',
  'Photo-1.png',
  'Photo-2.png',
];
const List<String> selectCategories = [
  'All Watches',
  'Collections',
  'Boutique',
  'Limited',
  'Expensive',
  'Classical'
];

const List<String> sortWatches = [
  'Price',
  'Popularity',
  'Sotirea',
  'Vase',
  'Top Selling',
  'Raiting',
  'Archeological',
];
List<Collections> collection2 = [
  Collections(0,
    'Gulcehre_ibrik.png',
    'Gulcehre Ibrik',
    '€5650',
  ),
  Collections(1,
    'MedicinalVase.png',
    'Kavuk Vase',
    '€4850',
  ),
  Collections(2,
    'MysticalVase.png',
    'Mystical Vase',
    '€3150',
  ),
];
List<Collections> collection = [
  Collections(0,
    'ThankGodBowl.png',
    'Thank God Bowl',
    '€1750',
  ),
  Collections(2,
    'KavukVase.png',
    'Kavuk Vase',
    '€4250',
  ),
  Collections(3,
    'RumiliKase.png',
    'Rumili Kase',
    '€2350',
  ),
  Collections(4,
    'SoteriaVazo.png',
    'Thank God Bowl',
    '€3450',
  ),
  Collections(5,
    'KavukVase.png',
    'Kavuk Vase',
    '€4250',
  ),
  Collections(6,
    'SoteriaVase.png',
    'Rumili Kase',
    '€2950',
  ),
];

List<Collections> allItem = [
  Collections(
    0,
    'ThankGodBowl.png',
    'Thank God Bowl',
    '€1750',
  ),
  Collections(
    1,
    'KavukVase.png',
    'Kavuk Vase',
    '€4250',
  ),
  Collections(
    2,
    'RumiliKase.png',
    'Rumili Kase',
    '€2350',
  ),
  Collections(
    3,
    'SoteriaVazo.png',
    'Hagia Sophia Deesis',
    '€3450',
  ),
  Collections(
    4,
    'KavukVase.png',
    'Kavuk Vase',
    '€4250',
  ),
  Collections(
    5,
    'SoteriaVase.png',
    'Soteria Vase',
    '€2950',
  ),
  Collections(
    6,
    'MysticalVase.png',
    'Mystical Vase',
    '€3150',
  ),
  Collections(
    7,
    'MedicinalVase.png',
    'Mystical Vase',
    '€4850',
  ),
  Collections(
    8,
    'Gulcehre_ibrik.png',
    'Gulcehre Ibrik',
    '€5650',
  ),
];
 List<Collections> categories =
      List<Collections>.generate(3, (int index) => allItem[index]);
  List<Collections> featured =
      List<Collections>.generate(3, (int index) => allItem[index + 3]);
  List<Collections> featured2 =
      List<Collections>.generate(3, (int index) => allItem[index + 6]);
List<Card> cardDetail = [
  Card("1234 5783 1231 9123", "Ugur Ates", "01", "2025", "312"),
  Card("4562 1478 5731 1425", "SCB", "03", "2026", "142"),
];

List<Method> method = [
  Method("Standard Shipping (16 days)", "FREE"),
  Method("Express (8 days)", "€40"),
  Method("Premium (1 day)", "€80"),
];

final InputDecoration decoration = InputDecoration(
  enabledBorder: const UnderlineInputBorder(
    borderSide: BorderSide(color: Color(0xffE5E5E5)),
  ),
  focusedBorder: const UnderlineInputBorder(
    borderSide: BorderSide(color: Color(0xFFCC9D76)),
  ),
  contentPadding: EdgeInsets.only(left: 10.w),
);

double pTop;
double pBottom;

class Collections {
  int id;
  String image;
  String name;
  String price;
  Collections(this.id, this.image, this.name, this.price);
}

class Card {
  String cardNumber;
  String cardHolderName;
  String month;
  String year;
  String cardHolder;
  Card(
    this.cardNumber,
    this.cardHolderName,
    this.month,
    this.year,
    this.cardHolder,
  );
}

class Method {
  String method;
  String price;
  Method(this.method, this.price);
}

class Country {
  String name;
  String code;
  Country(this.name, this.code);
}
