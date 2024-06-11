import 'dart:convert';
import 'package:ecommerce/model/slider_model.dart';
import 'package:ecommerce/resource/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SliderViewModal with ChangeNotifier {
  final List<SliderModel> _sliderData = [];
  List<SliderModel> get sliderDate => _sliderData;

  bool _isLoaidng = false;

  bool get isLoading => _isLoaidng;

  Future<void> fetchSliderApi() async {
    try {
      _isLoaidng = true;
      final response = await http
          .get(Uri.parse("https://saara24shopping.com/api/ecommerce/sliders"));

      if (response.statusCode == 200) {
        _sliderData.clear();

        var data = jsonDecode(response.body)['data'];

        for (var a in data) {
          _sliderData.add(SliderModel.fromJson(a));
        }

        _isLoaidng = false;
        notifyListeners();
      } else {
        String message = jsonDecode(response.body)['message'];
        ToastMessage.toastMsg(message, Colors.red);

        _isLoaidng = false;
        notifyListeners();
      }
    } catch (error) {
      _isLoaidng = false;
      notifyListeners();
      print(error);
    }
  }
}
