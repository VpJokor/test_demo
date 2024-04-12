// import 'package:shared_preferences/shared_preferences.dart';
//
// /**
//  * 引入依赖 shared_preferences: ^2.2.3
//  * 对Preference进行封装
//  * 只能用于基本数据类型： int、double、bool、string 和 List<String>。
//  */
// class PreferenceUtil {
//   PreferenceUtil._internal();
//
//   factory PreferenceUtil() => _instance;
//
//   static final PreferenceUtil _instance = PreferenceUtil._internal();
//
//   void commitInt(String key, int value) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setInt(key, value);
//   }
//
//   Future<int> getIntValue(String key, {int defaultValue = 0}) async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getInt(key) ?? defaultValue;
//   }
//
//   Future<void> removeValue(String key) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.remove('counter');
//   }
// }
