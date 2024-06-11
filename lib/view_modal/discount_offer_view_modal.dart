import 'dart:convert';
import 'package:ecommerce/model/discount_offer_modal.dart';
import 'package:ecommerce/model/slider_model.dart';
import 'package:ecommerce/resource/base_url.dart';
import 'package:ecommerce/resource/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class DiscountOfferViewModal with ChangeNotifier {
  final List<DiscountOfferModal> _discountData =[];
  List<DiscountOfferModal> get discountData => _discountData;
 bool _isLoading =false;
bool get isLoading => _isLoading;
Future<void> fetchDiscountApi() async{
try{
  _isLoading = true;
   final response = await http
          .get(Uri.parse(ApiUrls.discountUrlGet));

      if (response.statusCode == 200) {
        _discountData.clear();

        var data = jsonDecode(response.body)['data'];
        for (var a in data) {
           _discountData.add(DiscountOfferModal.fromJson(a));
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
