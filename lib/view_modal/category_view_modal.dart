import 'dart:convert';

import 'package:ecommerce/model/category_modal.dart';
import 'package:ecommerce/resource/base_url.dart';
import 'package:ecommerce/resource/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CategoryViewModal with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  final List<CategoryModal> _categoryData = [];

  List<CategoryModal> get categoryData => _categoryData;

  Future<void> fetchCategoryList() async {
    try {
      _isLoading = true;
      notifyListeners();
      final response = await http.get(Uri.parse(ApiUrls.categoryUrlGet));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body)['data'];
        _categoryData.clear();
        for (var i in data) {
          _categoryData.add(CategoryModal.fromJson(i));
        }
        _isLoading = false;
        notifyListeners();
      } else {
        String msg = jsonDecode(response.body)['message'];

        ToastMessage.toastMsg(msg, Colors.green);
        _isLoading = false;
        notifyListeners();
      }
    } catch (error) {
      print(error);
    }
  }
}
