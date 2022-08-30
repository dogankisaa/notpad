import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view_model/home_view_model.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({
    Key? key,
    required HomeViewModel controller,
    required this.pageBuilder,

  })  : _controller = controller,
        super(key: key);

  final HomeViewModel _controller;
  final IndexedWidgetBuilder pageBuilder;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: _controller.getList.length,
        child: Scaffold(
          appBar: AppBar(
            bottom:  TabBar(
              tabs:  List.generate(_controller.getList.length, (index) => Obx(()=> Text(_controller.getList[index])))
            ),
            
          ),
          body:  TabBarView(
            children:  List.generate(_controller.getList.length, (index) => Obx(()=> Text(_controller.getList[index])))
          ),
        ),
      ),
    );
  }
}
