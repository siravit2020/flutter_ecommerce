import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auto Complete TextField Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
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
    return Scaffold(
      body: SecondPage(),
    );
  }
}

class SecondPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  List<Catecories> suggestions = [
    Catecories("The Soteria Vase bears", 0),
    Catecories("The oteria Vase bears", 1),
    Catecories("Gaia’s Box…", 0),
    Catecories("Beykoz Decorative Bowl - Burgondy", 0),
  ];

  GlobalKey key = GlobalKey<AutoCompleteTextFieldState<Catecories>>();

  AutoCompleteTextField<Catecories> textField;

  Catecories selected;

  _SecondPageState() {
    textField = AutoCompleteTextField<Catecories>(
      decoration: InputDecoration(
          hintText: "Search Resturant:", suffixIcon: Icon(Icons.search)),
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
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('AutoComplete TextField Demo Complex'),
      ),
      body: Column(children: [
        Padding(
            child: Container(child: textField), padding: EdgeInsets.all(16.0)),
        Padding(
            padding: EdgeInsets.fromLTRB(0.0, 64.0, 0.0, 0.0),
            child: selected != null
                ? Column(children: [
                    ListTile(
                        title: Text(selected.title),
                        trailing: Text("Rating: ${selected.status}/5")),
                  ])
                : Icon(Icons.cancel)),
      ]),
    );
  }
}

class Catecories {
  //For the mock data type we will use review (perhaps this could represent a restaurant);
  int status;
  String title;

  Catecories(this.title, this.status);
}
