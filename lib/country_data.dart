// To parse this JSON data, do
//
//     final countryData = countryDataFromJson(jsonString);

import 'dart:convert';

List<CountryData> countryDataFromJson(String str) => List<CountryData>.from(
    json.decode(str).map((x) => CountryData.fromJson(x)));

String countryDataToJson(List<CountryData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CountryData {
  CountryData({
    this.name,
    this.code,
  });

  String name;
  String code;

  factory CountryData.fromJson(Map<String, dynamic> json) => CountryData(
        name: json["name"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "code": code,
      };
}
