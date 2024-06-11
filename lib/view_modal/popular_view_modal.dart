
import 'dart:convert';

import 'package:ecommerce/model/popular_product_modal.dart';
import 'package:ecommerce/resource/base_url.dart';
import 'package:ecommerce/resource/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PopularProductViewModal with ChangeNotifier {

final List<PopularProductModal> _popularData =[];
List<PopularProductModal> get popularData => _popularData;
  bool _isLoading =false;
bool get isLoading => _isLoading;
Future<void> fetchPopularApi() async{




try{
  _isLoading = true;
   final response = await http
          .get(Uri.parse(ApiUrls.popularUrlGet));

      if (response.statusCode == 200) {
         _popularData.clear();

        var data = jsonDecode(response.body)['data'];
        for (var a in data) {
            _popularData.add(PopularProductModal.fromJson(a));
        }
        _isLoading = false;
        notifyListeners();
      } else {
        String message = jsonDecode(response.body)['message'];
        ToastMessage.toastMsg(message, Colors.red);
        _isLoading = false;
        notifyListeners();
      }

}

catch(error){
  notifyListeners();
  print(error);
}



}
}