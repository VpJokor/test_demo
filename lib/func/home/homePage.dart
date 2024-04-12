import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'homePageController.dart';
import 'homePageState.dart';

class HomePage extends StatelessWidget {
  final HomePageController logic = Get.put(HomePageController());
  final HomePageState state = Get.find<HomePageController>().state;

  @override
  Widget build(BuildContext context) {
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
                  "Content id is  : ${state.id}",
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
          ]),
    );
  }
}
