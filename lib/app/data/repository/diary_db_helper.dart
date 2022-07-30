import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/diary_model.dart';

class DBHelper {
  static Database? _db;
  static const int _version = 1;
  static const String _tableName = 'memos';

  static Future<void> initDb() async {
    if (_db != null) {
      print('not null db');
      return;
    }
    try {
      String _path = await getDatabasesPath() + 'memos.db';
      print('in database path');
      _db = await openDatabase(_path, version: _version,
          onCreate: (Database db, int version) async {
            print('creating a new one');
            return db.execute(
              'CREATE TABLE $_tableName('
                  'id INTEGER PRIMARY KEY AUTOINCREMENT, '
                  'note TEXT,rate INTEGER, date STRING, drawing STRING )',
            );
          });
      print('Database Created');
    } catch (e) {
      print('???? Error = $e');
    }
  }

  static Future<int> insert(Diary diary) async {
    print('insert function called');
    try{
      return await _db!.insert(_tableName, diary.toJson());
    }catch(e){
      print("디비헬퍼 오류${e}");
    }
    return 0;
  }

  static Future<int> delete(Diary task) async {
    print('delete function called');
    return await _db!.delete(_tableName, where: 'id = ?', whereArgs: [task.id]);
  }
  static Future<int> deleteAll() async {
    print('delete All function called');
    return await _db!.delete(_tableName);
  }

  static Future<List<Map<String, dynamic>>> query() async {
    print('query function called');
    return await _db!.query(_tableName);
  }

  static Future<int> update(int id) async {
    print('update function called');
    return await _db!.rawUpdate('''
    UPDATE tasks
    SET isCompleted = ?
    WHERE id = ?
   ''', [1, id]);
  }

}