import 'package:contacto_app/data.dart';
import 'package:contacto_app/database_helper.dart';
import 'package:flutter/material.dart';

class DataProvider with ChangeNotifier {
  List<Data> dataList = [];
  DatabaseHelper dbHelper = DatabaseHelper();
  DataProvider() {
    _loadDataFromDatabase();
  }
  Future<void> _loadDataFromDatabase() async {
    dataList = await dbHelper.getData();
    notifyListeners();
  }

  Future<void> add(Data data) async {
    await dbHelper.insertData(data);
    _loadDataFromDatabase();
  }
}
