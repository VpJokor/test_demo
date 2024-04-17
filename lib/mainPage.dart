import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_demo/core/utils/logUtil.dart';
import 'package:test_demo/func/home/homePage.dart';
import 'package:test_demo/func/profile/profilePage.dart';
import 'package:test_demo/func/search/searchPage.dart';

import 'core/widget/KeepAliveWrapper.dart';

class MainPage extends StatefulWidget {
  // const MainPage({super.key, required this.title});
  const MainPage({super.key});
  final String title = "主页";
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 1;
  final List<Widget> _pages = [
    KeepAliveWrapper(
      keepAlive: true,
      child: SearchPage(),
    ),
    KeepAliveWrapper(
      keepAlive: true,
      child: HomePage(),
    ),
    KeepAliveWrapper(
      keepAlive: true,
      child: ProfilePage(),
    ),
  ];
  final PageController _pageController =
      PageController(initialPage: 1, keepPage: true);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(index,
          duration: const Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        titleTextStyle: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
        centerTitle: true,
        toolbarHeight: 40,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.zero,
                topRight: Radius.zero,
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10))),
        //与drawer只生效一个
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            logInfo(tag: "MainPage", "点击了返回按钮");
            Fluttertoast.showToast(
                msg: "This is Center Short Toast",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          },
        ),
      ),
      drawer: const Drawer(),
      drawerEnableOpenDragGesture: true,
      body: PageView(
        controller: _pageController,
        children: _pages,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
