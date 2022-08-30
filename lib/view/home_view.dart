import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notepad/core/constants/general_constants.dart';
import 'package:notepad/view_model/home_view_model.dart';

import '../core/widgets/tab_bar_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeViewModel _controller = Get.put(HomeViewModel());
    return Scaffold(
      floatingActionButton: const FloatingActionButtonWidget(),
      body: Padding(
          padding: GeneralConstants().generalHorizontalPadding,
          child: Column(
            children: [
              Expanded(
               
                child: DefaultTabController(
                    length: _controller.getList.length,
                    child: Scaffold(
                      appBar: AppBar(
                        bottom: TabBar(
                       
                            tabs: List.generate(
                                _controller.getList.length,
                                (index) =>
                                   Obx(() => Text(_controller.getList[index])))),
                      ),
                      body: TabBarView(
                          children: List.generate(
                              _controller.getList.length,
                              (index) =>
                                  Obx(() => Text(_controller.getList[index])))),
                    ),
                  ),
              )
            ],
          )),
    );
  }
}

class FloatingActionButtonWidget extends StatelessWidget {
  const FloatingActionButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeViewModel _controller = Get.put(HomeViewModel());
    return FloatingActionButton(
      onPressed: () {
        print("object");
        _controller.addNewTab("tabName");
      },
      child: const Center(
        child: Icon(Icons.add),
      ),
    );
  }
}
