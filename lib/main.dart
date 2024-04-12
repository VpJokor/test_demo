import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_demo/core/utils/preferenceUtil.dart';

import 'app.dart';

void main() {
  // 设置状态栏为透明
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}
