import 'dart:convert';

import 'package:get/get.dart';
import 'package:crypto/crypto.dart';
import '../data/model/diary_model.dart';
import '../data/repository/diary_db_helper.dart';


class DiaryController extends GetxController {
  RxList<Diary> diaryList = <Diary>[].obs;

  @override
  void onInit(){
    getDiarys();
  }

  Future<int> addDiarys({required Diary task}) async {
    diaryList.add(task);
    diaryList.refresh();
    return await DBHelper.insert(task);
  }

  // get all the data from table
  Future<void> getDiarys() async {
    final List<Map<String, dynamic>> memos = await DBHelper.query();
    print(memos);
    try{
      diaryList.assignAll(memos.map((data) => Diary.fromJson(data)).toList());}catch(e){print("dssivak"); print(e);}
  }

  // delete data from table
  void deleteDiarys(Diary task) async {
    await DBHelper.delete(task);
    getDiarys();
  }

  void deleteAllDiarys() async {
    await DBHelper.deleteAll();
  }

  // update data int table
  void markTaskCompleted(int id) async {
    await DBHelper.update(id);
    getDiarys();
  }

}