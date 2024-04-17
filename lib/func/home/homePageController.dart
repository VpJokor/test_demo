import 'package:get/get.dart';
import 'package:test_demo/core/bean/Album.dart';
import 'package:test_demo/core/net/http/albumApi.dart';
import 'package:test_demo/core/utils/logUtil.dart';
import 'package:test_demo/func/home/homePageState.dart';

class HomePageController extends GetxController {
  static const String _tag = "HomePageController";
  final HomePageState state = HomePageState();

  HomePageController();

  @override
  void onInit() {
    logInfo(tag: _tag, 'HomePageController onInit');
  }

  @override
  void onClose() {
    logInfo(tag: _tag, 'HomePageController onClose');
  }

  @override
  void onReady() {
    logInfo(tag: _tag, 'HomePageController onReady');
  }

  void onTap() {
    logInfo(tag: _tag, "HomePageController onTap");
    state.album.update((val) {
      val?.userId = (val.userId ?? 100) + 1;
    });
  }

  void getAlbumDataFromNet() {
    try {
      fetchAlbum().then((value) => {state.album.value = value});
    } catch (e) {
      logInfo(tag: _tag, "getAlbumDataFromNet error $e");
    }
  }

  void clearAlbumData() {
    state.album.update((val) {
      val?.userId = 0;
    });
  }
}
