import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:notepad/core/helper/notification.dart';
import 'package:notepad/core/helper/time_picker.dart';
import 'package:notepad/core/route.gr.dart';
import 'package:notepad/view_model/base_view_model.dart';
import 'package:notepad/view_model/home_view_model.dart';

class CardViewModel extends BaseViewModel {
  TextEditingController descriptionController = TextEditingController();
  bool isEditing = false;
  final _title = Hive.box("todos");
  List titleList = [];
  List dateList = [];
  String description = "";
  @override
  Future<void> init() async {
    titleList = _title.get("title") ?? [];
    dateList = _title.get("date") ?? [];

    notifyListeners();
  }

  getCardTitle(int index) {
    return _title.get("title")[index];
  }

  getCardDate(int index) {
    return _title.get("date")[index];
  }

  createNotification(index, context) {
    pickDate(context, _title.get("title")[index]);
  }

  editDescription(index, context) {
    isEditing = true;
    notifyListeners();
  }

  finishEditDescription() {
    isEditing = false;
    notifyListeners();
  }

  updateDescription(index) {
    _title.put(index, descriptionController.text);
    notifyListeners();
  }

  getDescription(index) {
    return _title.get(index);
  }

  onEditComplete(index) {
    isEditing = false;
    notifyListeners();
    finishEditDescription();
    updateDescription(index);
  }

  routeToHome(BuildContext context) {
    context.router.push(HomeView());
  }
}
