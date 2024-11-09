// To parse this JSON data, do
//
//     final productDetails = productDetailsFromJson(jsonString);

import 'dart:convert';

ProductDetails productDetailsFromJson(String str) =>
    ProductDetails.fromJson(json.decode(str));

String productDetailsToJson(ProductDetails data) => json.encode(data.toJson());

class ProductDetails {
  String? id;
  String? name;
  Data? data;

  ProductDetails({
    this.id,
    this.name,
    this.data,
  });

  factory ProductDetails.fromJson(Map<String, dynamic> json) => ProductDetails(
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
  String? color;
  String? capacity;

  Data({
    this.color,
    this.capacity,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        color: json["color"],
        capacity: json["capacity"],
      );

  Map<String, dynamic> toJson() => {
        "color": color,
        "capacity": capacity,
      };
}
