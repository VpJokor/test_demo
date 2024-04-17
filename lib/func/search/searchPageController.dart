import 'package:get/get.dart';
import 'package:test_demo/core/utils/logUtil.dart';

import 'searchPageState.dart';

class SearchPageController extends GetxController {
  final SearchPageState state = SearchPageState();

  SearchPageController();

  @override
  void onInit() {
    logInfo(tag: state.tag, "SearchPageController onInit");
  }

  @override
  void onReady() {
    logInfo(tag: state.tag, "SearchPageController onReady");
  }

  @override
  void onClose() {
    logInfo(tag: state.tag, "SearchPageController onClose");
  }
}
