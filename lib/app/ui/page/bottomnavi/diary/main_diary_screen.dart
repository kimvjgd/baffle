import 'package:baffle/app/data/model/diary_model.dart';
import 'package:baffle/app/ui/components/dong_colors.dart';
import 'package:baffle/app/ui/page/bottomnavi/diary/write_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/diary_controller.dart';
import '../../../../data/repository/diary_db_helper.dart';

class DiaryMainScreen extends StatefulWidget {
  const DiaryMainScreen({Key? key}) : super(key: key);

  @override
  State<DiaryMainScreen> createState() => _DiaryMainScreenState();
}

class _DiaryMainScreenState extends State<DiaryMainScreen> {
  final DiaryController _diaryController = Get.put(DiaryController());

  @override
  Widget build(BuildContext context) {
    double _hsz = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: _hsz*0.18,
            color: app_orange20,
            child: Padding(
              padding:const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Spacer(flex: 4,),
                 Text("감정일기",style: TextStyle(color: app_text,fontWeight: FontWeight.bold,fontSize: 25),),
                 Spacer(flex: 1,),
                 Text("08.16 (SUN)",style: TextStyle(color: app_light_text),),
                 Spacer(flex: 2,)
                ],
              ),
            ),
          ),
          Expanded(child: RefreshIndicator(
            onRefresh: _onRefresh,
            child: Obx(() => (ListView.builder(
                  itemCount:_diaryController.diaryList.length,
                  itemBuilder: (BuildContext context, int index) {
                    var data = _diaryController.diaryList[index];
                    return _content(data);
                  },
                )
          ))))
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () { Get.to(DiaryWriteScreen()); },
      ),
    );
  }


  Future<void> _onRefresh() async {
    _diaryController.getDiarys();
  }

  _content(Diary diary){
    return Card(
      child: ListTile(
        leading: FlutterLogo(),
        title:Text(diary.note ?? "에러"),
        trailing: Text(diary.date.toString()),
      ),
    );
  }
}



