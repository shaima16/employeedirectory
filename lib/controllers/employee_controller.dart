import 'package:employeedirectory/data/model/employee_model.dart';
import 'package:employeedirectory/data/repository/home_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class EmployeeController extends GetxController {

  late Future<Database> database;

  final List<Map<String, dynamic>> employeeHeader = List<Map<String, dynamic>>.empty(growable: true);
  late List<Map<String, dynamic>> employeeReadOnly;

  @override
  void onInit() {
    // openEmployeeDb();
    fetchEmployeeList();
    loadList("");
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> fetchEmployeeList() async {
    List<EmployeeModel> response = await HomeRepository().getHome();
    for (int i = 0; i >= response.length; i++) {
      insertDb(
        id: response[i].id,
        name: response[i].name,
        username: response[i].username,
        email: response[i].email,
        profileImage: response[i].profileImage,
        phone: response[i].phone,
        website: response[i].website,
        street: response[i].address?.street,
        suite: response[i].address?.suite,
        city: response[i].address?.city,
        zipcode: response[i].address?.zipcode,
        companyName:  response[i].company?.name,

      );
    }
  }

  Future<Database> openEmployeeDb() async {
    return database = openDatabase(
      join(await getDatabasesPath(), 'employee_database.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE employee"
          "(id INTEGER PRIMARY KEY, name TEXT, username TEXT,"
          "email TEXT,profileImage TEXT,phone INTEGER,website TEXT,"
          "street TEXT,suite TEXT,city TEXT,zipcode INTEGER,companyName TEXT )",
        );
      },
      version: 1,
    );
  }

  Future<void>  insertDb({
    id,
    name,
    username,
    email,
    profileImage,
    phone,
    website,
    street,
    suite,
    city,
    zipcode,
    companyName,
  }) async {
    try {
      Map<String, dynamic> mapInsertData = {};
      mapInsertData['id'] = id;
      mapInsertData['name'] = name;
      mapInsertData['username'] = username;
      mapInsertData['email'] = email;
      mapInsertData['profileImage'] = profileImage;
      mapInsertData['phone'] = phone;
      mapInsertData['website'] = website;
      mapInsertData['street'] = street;
      mapInsertData['suite'] = suite;
      mapInsertData['city'] = city;
      mapInsertData['zipcode'] = zipcode;
      mapInsertData['companyName'] = companyName;
      final Database db = await database;
      db.insert('employee', mapInsertData,
          conflictAlgorithm: ConflictAlgorithm.replace);
    } catch (e, st) {
      debugPrint("error" + e.toString());
    }
  }

  Future<List<Map<String, dynamic>>> getDb() async {
    late List<Map<String, dynamic>> result;
    try {
      final Database db = await database;
      result = await db.rawQuery("SELECT *  FROM  employee");
    } catch (e, st) {
      debugPrint("error" + e.toString());
    }
    return result;
  }
  Future<void> loadList(search) async {
    try {
      if(search!=null){
        employeeReadOnly = await getSearchDb(arguments: [search]);
      }else{
      employeeReadOnly = await getDb();}
      for (var element in employeeReadOnly) {
        var newElement = Map.of(element);
        employeeHeader.add(newElement);
      }
      update();
      debugPrint(employeeHeader.length.toString());

    } catch (e, st) {
      debugPrint("error" + e.toString());
    }
  }
  Future<List<Map<String, dynamic>>> getSearchDb({required List<Object> arguments}) async {
    late List<Map<String, dynamic>> result;
    try {
      final Database db = await database;
      result = await db.rawQuery("SELECT *  FROM  employee WHERE name = ? OR email = ?",arguments);
    } catch (e, st) {
      debugPrint("error" + e.toString());
    }
    return result;
  }
}
