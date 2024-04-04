// import 'dart:math';

// import 'package:new_package_installation/model/student_model.dart';
import 'dart:developer';

import 'package:new_package_installation/model/student_model.dart';
import 'package:sqflite/sqflite.dart';

class HomeScreenController{
 static late Database database; // creating db as global for access - must use static keyword
 static List<Map<String,Object?>> data = [];// list is not nullable
 static List<StudentModel>studentsList =[];
  // to initialise db
 static Future<void>initDb()async{
    // open the database
     database = await openDatabase("sample.db",version: 1,
    onCreate: (Database db,int version) async{
    // when creating the db,create the table
    await db.execute(
   'CREATE TABLE Student (id INTEGER PRIMARY KEY, name TEXT, phoneNumber INTEGER)');
    }
    );
  
  }
  // function to add  new data to database
  static Future addData() async{
      await database.rawInsert(
      'INSERT INTO Student(name, phoneNumber) VALUES(?, ?)',
      ['Anju', 12345678]);
  }

  // get all data from database
  static Future getAllData() async{
    data = await database.rawQuery('SELECT * FROM Student');
    studentsList = data.map((e) => StudentModel(
      id: int.parse(e["id"].toString()), 
      name: e["name"].toString(), 
      phone: int.parse(e["phoneNumber"].toString())))
      .toList();
    log(data.toString());
  }

  static Future deleteData( var id) async{
    await database
    .rawDelete('DELETE FROM StudentModel WHERE id = ?',["id"]);
    await getAllData();
  }
}