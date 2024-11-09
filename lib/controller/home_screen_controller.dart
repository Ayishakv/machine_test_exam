import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:machine_test_exam/model/home_screen_model.dart';

class HomeScreenController with ChangeNotifier {
  bool isproductloading = false;
  List<AllProduct> allProducts = [];
  Future<void> getallproducts() async {
    isproductloading = true;
    notifyListeners();
    final url = Uri.parse("https://api.restful-api.dev/objects");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      allProducts = allProductFromJson(response.body);
    }
    isproductloading = false;
    notifyListeners();
  }
}
