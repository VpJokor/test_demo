import 'package:get/get.dart';
import 'package:test_demo/func/home/homePageState.dart';

class HomePageController extends GetxController {
  final HomePageState state = HomePageState();

  HomePageController();

  @override
  void onInit() {
    print('HomePageController onInit');
  }

  @override
  void onClose() {
    print('HomePageController onClose');
  }

  @override
  void onReady() {
    print('HomePageController onReady');
  }
}
