import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notepad/view_model/base_view_model.dart';

class HomeViewModel extends BaseViewModel {
  TextEditingController newNoteLabelController = TextEditingController();

  final _todos = Hive.box("todos");

  List noteList = [];
  @override
  Future<void> init() async {
    noteList = _todos.get("todos") ?? [];

    notifyListeners();
  }

  Future<void> addNewTab(BuildContext context) async {
    noteList.add(newNoteLabelController.text);
    _todos.put("todos", noteList);
    print(_todos.get("todos"));
    print(noteList);
    notifyListeners();

    Navigator.pop(context);
  }

  void deletTab(int index) {
    noteList.removeAt(index);
    _todos.put("todos", noteList);

    notifyListeners();
  }
}
