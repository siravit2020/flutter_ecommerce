import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/global_widgets/global_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../color_plate.dart';
import '../constants.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import 'data.dart';

class SearchPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final w = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height - kToolbarHeight;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 4),
              child: IconButton(
                splashRadius: 20,
                icon: SvgPicture.asset(
                  'assets/icons/close.svg',
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            )
          ],
          backgroundColor: Colors.black,
          title: Text(
            "SEARCH",
            style: TextStyle(
                fontSize: 13, fontFamily: 'avenirB', color: Colors.white),
          ),
        ),
        body: Container(
          width: double.infinity,
          constraints: new BoxConstraints(
            minHeight: height,
          ),
          decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(20.0),
              topRight: const Radius.circular(20.0),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 34.5,
                ),
                Text(
                  "Find your watch",
                  style: TextStyle(
                      color: Colors.black, fontSize: 30, fontFamily: 'avenirH'),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                    "Search through more than 1000+ watches",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'avenirB',
                    ),
                    textAlign: TextAlign.center),
                SizedBox(
                  height: 49.5,
                ),
                MyHomePage()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SecondPage();
  }
}

class SecondPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  FocusNode focus = FocusNode();
  List<Catecories> suggestions = [
    Catecories("The Soteria Vase bears", 0),
    Catecories("The oteria Vase bears", 1),
    Catecories("Gaia’s Box…", 0),
    Catecories("Beykoz Decorative Bowl - Burgondy", 0),
  ];

  GlobalKey key = GlobalKey<AutoCompleteTextFieldState<Catecories>>();

  AutoCompleteTextField<Catecories> textField;

  Catecories selected;
  @override
  void initState() {
    super.initState();
     focus.addListener(_onFocusChange);
  }
 void _onFocusChange(){
    debugPrint("Focus: "+focus.hasFocus.toString());
    setState(() {
          
        });
  }
  _SecondPageState() {
    textField = AutoCompleteTextField<Catecories>(
      focusNode: focus,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xffE5E5E5)),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFCC9D76)),
        ),
        contentPadding: EdgeInsets.only(left: 10),
        labelText: 'Email address',
      ),
      itemSubmitted: (item) => setState(() => selected = item),
      key: key,
      suggestions: suggestions,
      itemBuilder: (context, suggestion) => Padding(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              Text(
                suggestion.title,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                (suggestion.status == 0) ? "Most popular" : "Recent searches",
                style: TextStyle(fontSize: 14, color: Color(0xff676870)),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
          padding: EdgeInsets.all(8.0)),
      itemSorter: (a, b) => a.status == b.status
          ? 0
          : a.status > b.status
              ? -1
              : 1,
      itemFilter: (suggestion, input) =>
          suggestion.title.toLowerCase().startsWith(input.toLowerCase()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
   
    return Column(children: [
      Padding(
          child: Container(
            child: Stack(
              alignment: const Alignment(1.0, 1.0),
              children: [
                textField,
                Container(
                  padding: const EdgeInsets.all(0.0),
                  child: IconButton(
                    onPressed: () {
                      // visible.change();
                    },
                    icon: SvgPicture.asset('assets/icons/search.svg',  color: (focus.hasFocus)
                        ? brownGoldColor
                        : Colors.black,),
                    iconSize: 16,
                  ),
                ),
              ],
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: w * 0.08)),
      Padding(
          padding: EdgeInsets.fromLTRB(0.0, 64.0, 0.0, 0.0),
          child: selected != null
              ? Column(children: [
                  ListTile(
                      title: Text(selected.title),
                      ),
                ])
              : SizedBox()),
    ]);
  }
}

class Catecories {
  //For the mock data type we will use review (perhaps this could represent a restaurant);
  int status;
  String title;

  Catecories(this.title, this.status);
}
