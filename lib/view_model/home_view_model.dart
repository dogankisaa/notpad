import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notepad/core/route.gr.dart';
import 'package:notepad/view_model/base_view_model.dart';

class HomeViewModel extends BaseViewModel {
  TextEditingController newNoteLabelController = TextEditingController();
  TextEditingController searchNoteController = TextEditingController();
  DateTime now = DateTime.now();
  final _title = Hive.box("todos");
  int currentIndex = 0;
  List titleList = [];
  List dateList = [];
  List searchedTitleList = [];
  List searchedDateList = [];
  @override
  Future<void> init() async {
    titleList = _title.get("title") ?? [];
    dateList = _title.get("date") ?? [];

    notifyListeners();
  }

  searchCard() {
    searchNoteController.text.split(" ").forEach((word) {
      searchedTitleList
          .addAll(titleList.where((element) => element.contains(word)));
      searchedTitleList = searchedTitleList.toSet().toList();
      searchedDateList
          .addAll(titleList.where((element) => element.contains(word)));
      searchedDateList = searchedDateList.toSet().toList();
    });
    notifyListeners();
    print(searchedDateList);
    print(searchedTitleList);
  }

  addNewTab(BuildContext context) {
    titleList.insert(0, newNoteLabelController.text);
    dateList.insert(0, "${now.day} ${now.month} ${now.year}");
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

  routeCardView(BuildContext context, int index) {
    currentIndex = index;
    notifyListeners();
    context.router.push(CardView(index: index));
  }

  showDescription(index) {
    return _title.get(index);
  }
}
