import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

class CachedHelper{
  static late SharedPreferences sharedPreferences ;
  static init()async{
    sharedPreferences = await SharedPreferences.getInstance();
  }
  static Future<bool> putBoolean (String key , bool value )async{
    return await sharedPreferences.setBool(key, value);

    }
    static bool? getBoolean(String key){
    return sharedPreferences.getBool(key);
    }
}