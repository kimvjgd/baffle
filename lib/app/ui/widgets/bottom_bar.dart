import 'dart:io';

import 'package:baffle/app/ui/widgets/pop_up.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/bottom_navi_controller.dart';
import '../page/bottomnavi/diary/main_diary_screen.dart';
import '../page/bottomnavi/home/main_home_screen.dart';
import '../page/bottomnavi/setting/main_setting_screen.dart';
import '../page/bottomnavi/study/main_study_screen.dart';

class IndexScreen extends GetView<BottomNavController> {
  const IndexScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(BottomNavController());
    return WillPopScope(
      child: Obx(() => Scaffold(
        body: Center(
          child: IndexedStack(
            index: controller.pageIndex.value,
            children: [
              HomeMainScreen(),
              StudyMainScreen(),
              DiaryMainScreen(),
              SettingMainScreen(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: controller.pageIndex.value,
          elevation: 0,
          onTap: (value) {
            controller.changeBottomNav(value);
          },
          items: [
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/images/icons/home.png")),
              activeIcon: ImageIcon(AssetImage("assets/images/icons/home.png"),color: Colors.green,),
              label: 'home',
            ),
            BottomNavigationBarItem(
                icon:  ImageIcon(AssetImage("assets/images/icons/study.png")),
                activeIcon: ImageIcon(AssetImage("assets/images/icons/study.png",),color: Colors.green,),
                label: 'list'),
            BottomNavigationBarItem(
                icon:  ImageIcon(AssetImage("assets/images/icons/diary.png")),
                activeIcon: ImageIcon(AssetImage("assets/images/icons/diary.png",),color: Colors.green,),
                label: 'chat'),
            BottomNavigationBarItem(
                icon:  ImageIcon(AssetImage("assets/images/icons/setting.png")),
                activeIcon: ImageIcon(AssetImage("assets/images/icons/setting.png",),color: Colors.green,),
                label: 'setting'),
          ],
        ),
      )),
      onWillPop: willPopAction,
    );
  }

  Future<bool> willPopAction() async {
    showDialog(
        context: Get.context!,
        builder: (context) => MessagePopup(
          title: '모모두',
          message: '정말 종료하시겠습니까?',
          okCallback: () {
            exit(0);
          },
          cancelCallback: Get.back,
        ));
    return true;
  }
}