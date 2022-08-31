import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class HomeViewModel extends GetxController {
  RxList tabList = ["asdasd"].obs;

  get getList => tabList.value;

  void addNewTab(String tabName) {
    tabList.add(tabName);

  }

  void deletTab(int index) {
    tabList.value.removeAt(index);
  }


}
