import 'package:get/get.dart';
import 'package:test_demo/core/utils/logUtil.dart';

import 'ProfilePageState.dart';

class ProfilePageController extends GetxController {
  final ProfilePageState state = ProfilePageState();

  @override
  void onInit() {
    logInfo(tag: state.tag, "ProfilePageController onInit");
  }

  @override
  void onReady() {
    logInfo(tag: state.tag, "ProfilePageController onReady");
  }

  @override
  void onClose() {
    logInfo(tag: state.tag, "ProfilePageController onClose");
  }
}
