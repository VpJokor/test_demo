import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_demo/core/utils/logUtil.dart';

import 'homePageController.dart';
import 'homePageState.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final HomePageController controller = Get.put(HomePageController());
  final HomePageState state = Get.find<HomePageController>().state;

  @override
  Widget build(BuildContext context) {
    logInfo(tag: state.tag, "HomePage build ");
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "使用obx进行包裹",
            ),
            Obx(() => Text(
                  "This page is ${state.pageName}",
                  maxLines: 1,
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  // style: Theme.of(context).textTheme.headlineMedium,
                )),
            GetBuilder<HomePageController>(
              assignId: true,
              builder: (controller) {
                return Text(
                  "Page content data is : ${state.pageContent}",
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            GetBuilder<HomePageController>(
              id: state.id,
              builder: (controller) {
                return Text(
                  "Content id is : ${state.id}",
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            Obx(() => Text(
                  "Album userId is ${state.album.value.userId ?? "无ID"}",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                )),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: controller.onTap,
              child: Container(
                decoration: const BoxDecoration(color: Colors.blue),
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Change Id",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: controller.getAlbumDataFromNet,
              child: Container(
                decoration: const BoxDecoration(color: Colors.blue),
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "getAlbumDataFromNet",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: controller.clearAlbumData,
              child: Container(
                decoration: const BoxDecoration(color: Colors.blue),
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "clearAlbumData",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ]),
    );
  }
}
