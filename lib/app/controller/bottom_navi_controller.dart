import 'package:get/get.dart';

enum PageName{HOME, STUDY ,DIARY, SETTING}

class BottomNavController extends GetxController {

  RxInt pageIndex = 0.obs;

  void changeBottomNav(int value) {
    var page = PageName.values[value];
    switch(page) {
      case PageName.HOME:
      case PageName.STUDY:
      case PageName.DIARY:
      case PageName.SETTING:
        _changePage(value);
        break;
    };
  }

  void _changePage(int value) {
    pageIndex(value);
  }

}