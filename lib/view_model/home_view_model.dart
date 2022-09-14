import 'package:flutter/material.dart';
import 'package:notepad/view_model/base_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeViewModel extends BaseViewModel {
  List noteList = [];
  @override
  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    noteList.addAll([1,2,3]);
     notifyListeners();
  }

  TextEditingController newNoteLabelController = TextEditingController();

  Future<void> addNewTab(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('items', <String>[newNoteLabelController.text]);
    noteList.add(prefs.getStringList("items"));
    print(prefs.getStringList("items"));

    notifyListeners();

    Navigator.pop(context);
  }

  void deletTab(int index) {
    noteList.removeAt(index);
  }

  void showNewNoteInputs(BuildContext context, Widget noteInputs) {
    showModalBottomSheet(
      context: context,
      builder: (context) => noteInputs,
    );
  }
}
