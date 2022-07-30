import 'package:get/get.dart';

import '../controller/bottom_navi_controller.dart';
import '../controller/diary_controller.dart';


class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavController(), permanent: true);
    Get.put(DiaryController(),permanent: true);
  }

  // static diaryBinding(){
  //   Get.put(DiaryController(),permanent: true);
  // }

  //
  // // static BottomNavBinding() {
  // //   Get.put(BottomNavController(), permanent: true);
  // // }
  //
  // static additionalBinding() {
  //   // Get.put(MypageController(), permanent: true);
  //   Get.put(PostController(), permanent: true);
  //   Get.put(ChatroomController(), permanent: true);
  // }
  //
  // static commentBinding() {
  //   // Get.put(CommentController(),permanent: false);
  //   Get.lazyPut(() => CommentController());
  // }
  //
  // static chatroomBinding(String chatroomKey) {
  //   Get.lazyPut(() => ChatController(chatroomKey));
  // }

}