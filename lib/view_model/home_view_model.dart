import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notepad/view_model/base_view_model.dart';

class HomeViewModel extends BaseViewModel {
  TextEditingController newNoteLabelController = TextEditingController();
  TextEditingController searchNoteController = TextEditingController();
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
    updateBox("title", titleList);
    updateBox("date", dateList);

    notifyListeners();

    Navigator.pop(context);
  }

  void deletTab(int index) {
    deleteCard(titleList, index);
    deleteCard(dateList, index);

    updateBox("title", titleList);
    updateBox("date", dateList);

    notifyListeners();
  }

  deleteCard(list, index) {
    list.removeAt(index);
  }

  updateBox(name, list) {
    _title.put(name, list);
  }
}
