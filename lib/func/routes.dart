import 'package:get/get.dart';

import '../mainPage.dart';

/**
 * 这里放所有页面的路由
 */
class Routes {
  //主页
  static const String mainPage = '/main';
  //登录&注册
  static const String loginPage = '/login';
  //开屏
  static const String splashPage = '/splash';
  //个人主页
  static const String profilePage = '/profile';
  //设置页
  static const String settingPage = '/setting';

  /**
   * 路由映射表
   */
  static final List<GetPage> getPages = [
    GetPage(name: mainPage, page: () => const MainPage()),
  ];
}
