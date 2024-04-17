import 'package:get/get.dart';

import '../../core/bean/Album.dart';

class HomePageState {
  HomePageState();
  String tag = "HomePage";

  String id = "wddsad";
  RxString pageName = "HomePage".obs;
  RxString pageContent = RxString("Content data");
  Rx<Album> album = Album(userId: 0, id: 0, title: "title").obs;
}
