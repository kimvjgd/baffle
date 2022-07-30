import 'package:baffle/app/binding/init_bindings.dart';
import 'package:baffle/app/controller/diary_controller.dart';
import 'package:baffle/app/ui/components/dong_colors.dart';
import 'package:baffle/app/ui/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/data/repository/diary_db_helper.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDb();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //DiaryController().deleteAllDiarys();
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        canvasColor: app_orange10,
      ),
      initialBinding: InitBinding(),
      home: IndexScreen(),
    );
  }
}
