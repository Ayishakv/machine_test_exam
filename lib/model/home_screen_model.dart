// To parse this JSON data, do
//
//     final allProduct = allProductFromJson(jsonString);

import 'dart:convert';

List<AllProduct> allProductFromJson(String str) =>
    List<AllProduct>.from(json.decode(str).map((x) => AllProduct.fromJson(x)));

String allProductToJson(List<AllProduct> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllProduct {
  int? id;
  String? name;
  Data? data;

  AllProduct({
    this.id,
    this.name,
    this.data,
  });

  factory AllProduct.fromJson(Map<String, dynamic> json) => AllProduct(
        id: json["id"],
        name: json["name"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "data": data?.toJson(),
      };
}

class Data {
  int? year;
  double? price;
  String? cpuModel;
  String? hardDiskSize;

  Data({
    this.year,
    this.price,
    this.cpuModel,
    this.hardDiskSize,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        year: json["year"],
        price: json["price"]?.toDouble(),
        cpuModel: json["CPU model"],
        hardDiskSize: json["Hard disk size"],
      );

  Map<String, dynamic> toJson() => {
        "year": year,
        "price": price,
        "CPU model": cpuModel,
        "Hard disk size": hardDiskSize,
      };
}
