import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class AuthStorage {
  static Future<void> saveLoginValue(dynamic token, dynamic data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString("token",jsonEncode(token));

    prefs.setString("userInfo", jsonEncode(data));

   
    prefs.setBool("isLogin", true);
  }






}
