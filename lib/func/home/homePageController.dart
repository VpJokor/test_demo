import 'package:get/get.dart';
import 'package:test_demo/core/bean/Album.dart';
import 'package:test_demo/core/net/http/albumApi.dart';
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

  void onTap() {
    print("HomePageController onTap");
    state.album.update((val) {
      val?.userId = (val.userId ?? 100) + 1;
    });
  }

  void getAlbumDataFromNet() {
    try {
      fetchAlbum().then((value) => {state.album.value = value});
    } catch (e) {
      print(e);
    }
  }

  void clearAlbumData() {
    state.album.update((val) {
      val?.userId = 0;
    });
  }
}
