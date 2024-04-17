import 'package:get/get.dart';
import 'package:test_demo/core/bean/Album.dart';
import 'package:test_demo/core/net/http/albumApi.dart';
import 'package:test_demo/core/utils/logUtil.dart';
import 'package:test_demo/func/home/homePageState.dart';

class HomePageController extends GetxController {
  final HomePageState state = HomePageState();

  HomePageController();

  @override
  void onInit() {
    logInfo(tag: state.tag, 'HomePageController onInit');
  }

  @override
  void onClose() {
    logInfo(tag: state.tag, 'HomePageController onClose');
  }

  @override
  void onReady() {
    logInfo(tag: state.tag, 'HomePageController onReady');
  }

  void onTap() {
    logInfo(tag: state.tag, "HomePageController onTap");
    state.album.update((val) {
      val?.userId = (val.userId ?? 100) + 1;
    });
  }

  void getAlbumDataFromNet() {
    try {
      fetchAlbum().then((value) => {state.album.value = value});
    } catch (e) {
      logInfo(tag: state.tag, "getAlbumDataFromNet error $e");
    }
  }

  void clearAlbumData() {
    state.album.update((val) {
      val?.userId = 0;
    });
  }
}
