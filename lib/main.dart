import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_demo/core/utils/preferenceUtil.dart';

import 'app.dart';

void main() {
  // 设置状态栏为透明
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  // PreferenceUtil().commitInt('key', 1234456);
  // Future<int> value = PreferenceUtil().getIntValue("key",defaultValue: 4564);
  // print('value is $value')
  runApp(const MyApp());
}
