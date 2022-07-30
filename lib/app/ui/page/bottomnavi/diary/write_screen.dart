import 'package:baffle/app/controller/diary_controller.dart';
import 'package:baffle/app/ui/widgets/next_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../controller/diary_controller.dart';
import '../../../../data/model/diary_model.dart';
import '../../../components/dong_colors.dart';

class DiaryWriteScreen extends StatefulWidget {
  const DiaryWriteScreen({Key? key}) : super(key: key);

  @override
  State<DiaryWriteScreen> createState() => _DiaryWriteScreenState();
}

class _DiaryWriteScreenState extends State<DiaryWriteScreen> {

  TextEditingController _memoController = TextEditingController();
  Diary diary = Diary();
  @override
  Widget build(BuildContext context) {
    Get.put(DiaryController);
    double _hsz = MediaQuery.of(context).size.height;
    return  Scaffold(
      resizeToAvoidBottomInset: false,
          appBar: AppBar(
            elevation: 0.0,
          ),
          body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              Container(
                height: _hsz * 0.28,
                color: app_orange20,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(
                      flex: 5,
                    ),
                    Text(
                      "오늘 하루는 어떠셨나요?",
                      style: TextStyle(
                          color: app_text,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Text(
                      "나의 감정의 온도를 선택해주세요.",
                      style: TextStyle(color: app_light_text),
                    ),
                    Spacer(
                      flex: 2,
                    )
                  ],
                  ),)
              ),
             // Expanded(flex: 1, child: _RatePicker()),
              Expanded(flex: 2, child: _Note()),
              NextButton(text: "text", state: true, onPressed: () async {
                await _addTasksToDb();
                Get.back();
              })]
      ),
    );
  }

Padding _RatePicker() {
  return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
          elevation: 5,
          shadowColor: app_orange20,
          borderRadius: BorderRadius.circular(10),
          color: app_white,
          child: Column(
            children: [
              FlutterLogo(),
            ],
          )));
}

Padding _Note() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Material(
      elevation: 5,
      shadowColor: app_orange20,
      borderRadius: BorderRadius.circular(10),
      color: app_white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FlutterLogo(),
          TextFormField(
            controller: _memoController,
          ),
          FlutterLogo(),
        ],
      ),
    ),
  );
}

  _addTasksToDb() async {
    try {

      int value = await DiaryController().addDiarys(
        task: Diary(
          note: _memoController.text,
          date: DateFormat.yMd().format(DateTime.now()).toString(),
          rate: 3,
          drawing: "not yet"
        ),
      );
      print('id value = $value');
    } catch (e) {
      print('머임 Error = $e');
      printError();
      printInfo();
    }
  }

}