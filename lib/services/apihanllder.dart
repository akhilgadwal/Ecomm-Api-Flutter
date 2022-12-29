import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_api_flutter_course/models/api_products.dart';

import '../consts/constapi.dart';

class Apihanlder {
  static Future<List<ProductsModel>> getAllProdcuts() async {
    var uri = Uri.https(baseUrl, 'api/v1/products');
    var reponse = await http.get(uri);
    // print("reponse ${jsonDecode(reponse.body)}");
    var data = jsonDecode(reponse.body);
    List tempList = [];
    for (var value in data) {
      tempList.add(value);
    }
    return ProductsModel.productsFromsnapshots(tempList);
  }
}
