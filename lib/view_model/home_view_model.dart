import 'package:flutter/material.dart';


class HomeViewModel extends ChangeNotifier {
    
  
  List noteList = ["Örnek Not"];
  
  TextEditingController newNoteLabelController = TextEditingController();
  get getNoteList {
    return noteList;
  }

  void addNewTab(BuildContext context){
    noteList.add(newNoteLabelController.text);
    notifyListeners();
    Navigator.pop(context);
    notifyListeners();
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
