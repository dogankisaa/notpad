import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notepad/view_model/base_view_model.dart';

class HomeViewModel extends BaseViewModel {
  TextEditingController newNoteLabelController = TextEditingController();
  DateTime now = DateTime.now();
  final _title = Hive.box("todos");

  List titleList = [];
  List dateList = [];
  @override
  Future<void> init() async {
    titleList = _title.get("title") ?? [];
    dateList = _title.get("date") ?? [];

    notifyListeners();
  }

  Future<void> addNewTab(BuildContext context) async {
    titleList.add(newNoteLabelController.text);
    dateList.add("${now.day} ${now.month} ${now.year}");
    _title.put("title", titleList);
    _title.put("date", dateList);
    notifyListeners();

    Navigator.pop(context);
  }

  void deletTab(int index) {
    titleList.removeAt(index);
    dateList.removeAt(index);
    _title.put("title", titleList);
    _title.put("date", dateList);

    notifyListeners();
  }
}
