import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:machine_test_exam/model/details_screen_model.dart';

class DetailScreenController with ChangeNotifier {
  ProductDetails? productdetails;
  bool isloading = false;
  Future<void> getproductdetails({required String productid}) async {
    isloading = true;
    notifyListeners();
    final url = Uri.parse("https://api.restful-api.dev/objects/$productid");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      productdetails = productDetailsFromJson(response.body);
    }
    isloading = false;
    notifyListeners();
  }
}
