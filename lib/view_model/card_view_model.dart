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
  @override
  Future<void> init() async {
    HomeViewModel vm = HomeViewModel();
    print(vm.currentIndex);
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

  showDescription(index, context) {
    return isEditing
        ? TextFormField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                border: InputBorder.none, prefixText: _title.get(index)),
            maxLines: null,
            controller: descriptionController,
            onTap: () => descriptionController.text == _title.get(index),
            onEditingComplete: () {
              isEditing = false;
              notifyListeners();
              _title.put(index, descriptionController.text);
            },
          )
        : Align(
            alignment: Alignment.centerLeft,
            child: Text(
              _title.get(index) ?? "Edit to add description",
              style: Theme.of(context).textTheme.headline4,
            ),
          );
  }
}
