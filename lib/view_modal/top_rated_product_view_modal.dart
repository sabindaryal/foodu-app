import 'dart:convert';
import 'package:ecommerce/model/top_rated_product_modal.dart';
import 'package:ecommerce/resource/base_url.dart';
import 'package:ecommerce/resource/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart"as http;
class TopRatedProductViewModel with ChangeNotifier {

final List<TopRatedProductmodal> _topRatedData=[];
 List<TopRatedProductmodal> get topRatedData => _topRatedData;

 bool _isLoading = false;
bool get isLoading => _isLoading;


Future<void> fetchTopRatedApi()async   {

try{
_isLoading = true;
final response = await http.get(Uri.parse(ApiUrls.topRatedUrlGet));

print(response.body);

if(response.statusCode==200){
_topRatedData.clear();

var data = jsonDecode(response.body)['dta'];
for (var a in data){
  _topRatedData.add(TopRatedProductmodal.fromJson(a));
 
}
_isLoading = false;
notifyListeners();

}else{

  String message = jsonDecode(response.body)['message'];
  ToastMessage.toastMsg(message, Colors.red);
  _isLoading = false;
  notifyListeners();
}
}
catch(error)
{  print(error);
}


}







}