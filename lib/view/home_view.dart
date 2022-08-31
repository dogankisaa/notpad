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
    return Column(
      children: [
        Expanded(
          child: DynamicTabBarWidget(controller: _controller),
        )
      ],
    );
  }
}

class DynamicTabBarWidget extends StatelessWidget {
  const DynamicTabBarWidget({
    Key? key,
    required HomeViewModel controller,
  })  : _controller = controller,
        super(key: key);

  final HomeViewModel _controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DefaultTabController(
        length: _controller.getList.length,
        child: Scaffold(
          floatingActionButton: FloatingActionButtonWidget(),
          appBar: AppBar(
            bottom: PreferredSize(
              preferredSize: Size.zero,
              child: TabBar(
                isScrollable: true,
                  tabs: List.generate(_controller.getList.length,
                      (index) => Text(_controller.getList[index]))),
            ),
          ),
          body: TabBarView(
              children: List.generate(_controller.getList.length,
                  (index) => Text(_controller.getList[index]))),
        ),
      ),
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
        _controller.addNewTab("tabName");
      },
      child: const Center(
        child: Icon(Icons.add),
      ),
    );
  }
}
