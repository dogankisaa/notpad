import 'package:awesome_notifications/awesome_notifications.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:notepad/core/helper/new_todo_bottom_sheet.dart';
import 'package:notepad/core/helper/notification.dart';
import 'package:notepad/core/helper/tab_creater_bottom_sheet.dart';
import 'package:notepad/core/helper/time_picker.dart';
import 'package:notepad/view_model/card_view_model.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../core/constants/general_constants.dart';
import '../view_model/home_view_model.dart';

class CardView extends StatelessWidget {
  final currentIndex;
  const CardView({super.key, this.currentIndex});

  @override
  Widget build(BuildContext context) {
    final noteDo = Provider.of<HomeViewModel>(context);
    late CardViewModel viewModel;
    late BuildContext _context;
    return ChangeNotifierProvider.value(
      value: viewModel = CardViewModel(),
      builder: (context, child) {
        _context = context;
        return Scaffold(
          appBar: customAppBar(),
          body: WillPopScope(
            onWillPop: () {
              viewModel.routeToHome(context);
              return Future.value(false);
            },
            child: SingleChildScrollView(
              child: Padding(
                padding: GeneralConstants().generalPadding,
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    titleAndDateWidget(viewModel, context),
                    SizedBox(
                      height: 10,
                    ),
                    descriptionWidget(context, viewModel, currentIndex),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Consumer descriptionWidget(
      BuildContext context, CardViewModel viewModel, int index) {
    return Consumer<CardViewModel>(
      builder: (context, value, child) => Container(
        decoration: BoxDecoration(
            color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              viewModel.isEditing
                  ? TextFormField(
                      autofocus: true,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: viewModel.getDescription(index),
                      ),
                      maxLines: null,
                      controller: viewModel.descriptionController,
                      onTap: () =>
                          viewModel.descriptionController.text ==
                          viewModel.getDescription(index),
                      onEditingComplete: () {
                        viewModel.onEditComplete(currentIndex);
                      },
                    )
                  : Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        viewModel.getDescription(index) ??
                            "Edit to add description",
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () =>
                          viewModel.editDescription(index, context),
                      icon: Icon(Icons.edit)),
                  IconButton(
                      onPressed: () =>
                          viewModel.createNotification(index, context),
                      //reminder(viewModel.getCardTitle(index)),
                      icon: Icon(Icons.alarm)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container titleAndDateWidget(CardViewModel viewModel, BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                viewModel.getCardTitle(currentIndex),
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: Colors.black),
              ),
              Text(
                viewModel.getCardDate(currentIndex),
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: Colors.grey,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar customAppBar() {
    return AppBar(
      leadingWidth: 80,
      leading: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
          child: const Icon(
            Icons.keyboard_arrow_left,
            size: 40,
          ),
        ),
      ),
      elevation: 0,
      automaticallyImplyLeading: false,
      centerTitle: true,
    );
  }
}
