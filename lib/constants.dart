import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



const List<String> categoriesImage = [
  'ThankGodBowl.png',
  'KavukVase.png',
  'RumiliKase.png'
];
const List<String> categoriesName = [
  'Thank God Bowl',
  'Kavuk Vase',
  'Rumili Kase'
];
const List<String> categoriesPrice = [
  '€1750',
  '€4250',
  '€2350',
];
const List<String> featuredName = [
  'Hagia Sophia Deesis',
  'Kavuk Vase',
  'Soteria Vase',
];
const List<String> featuredImage = [
  'SoteriaVazo.png',
  'KavukVase.png',
  'SoteriaVase.png',
];
const List<String> featuredPrice = [
  '€3450',
  '€4250',
  '€2950',
];

const List<String> featuredName2 = [
  'Mystical Vase',
  'Mystical Vase',
  'Gulcehre Ibrik',
];
const List<String> featuredImage2 = [
  'MysticalVase.png',
  'MedicinalVase.png',
  'Gulcehre_ibrik.png',
];
const List<String> featuredPrice2 = [
  '€3150',
  '€4850',
  '€5650',
];
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
  Collections(
    'Gulcehre_ibrik.png',
    'Gulcehre Ibrik',
    '€5650',
  ),
  Collections(
    'MedicinalVase.png',
    'Kavuk Vase',
    '€4850',
  ),
  Collections(
    'MysticalVase.png',
    'Mystical Vase',
    '€3150',
  ),
];
List<Collections> collection = [
  Collections(
    'ThankGodBowl.png',
    'Thank God Bowl',
    '€1750',
  ),
  Collections(
    'KavukVase.png',
    'Kavuk Vase',
    '€4250',
  ),
  Collections(
    'RumiliKase.png',
    'Rumili Kase',
    '€2350',
  ),
  Collections(
    'SoteriaVazo.png',
    'Thank God Bowl',
    '€3450',
  ),
  Collections(
    'KavukVase.png',
    'Kavuk Vase',
    '€4250',
  ),
  Collections(
    'SoteriaVase.png',
    'Rumili Kase',
    '€2950',
  ),
];

List<Method> method = [
  Method("Standard Shipping (16 days)", "FREE"),
  Method("Express (8 days)", "€40"),
  Method("Premium (1 day)", "€80"),
];

double pTop;
double pBottom;

class Collections {
  String image;
  String name;
  String price;
  Collections(this.image, this.name, this.price);
}

class Method {
  String method;
  String price;
  Method(this.method, this.price);
}
