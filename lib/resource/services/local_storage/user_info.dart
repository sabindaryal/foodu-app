import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class UserLocalInfo {
  static Future<String> getUserImge() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String data = prefs.getString("userInfo").toString();

    return jsonDecode(data)['profile_image'];
  }
}
