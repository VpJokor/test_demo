import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:test_demo/core/utils/logUtil.dart';
import 'package:test_demo/func/profile/profilePageController.dart';

import 'ProfilePageState.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  final ProfilePageController controller = Get.put(ProfilePageController());
  final ProfilePageState state = Get.find<ProfilePageController>().state;

  @override
  Widget build(BuildContext context) {
    logInfo(tag: state.tag, "ProfilePage build");
    return const Center(
      child: Text('Search Screen'),
    );
  }
}
