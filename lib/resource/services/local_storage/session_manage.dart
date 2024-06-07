import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SessonManage {
  static Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return jsonDecode(prefs.getString("token").toString());
  }

  static Future<bool> loginCheck() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getBool("isLogin") ?? false;
  }
}
