import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:notepad/core/constants/general_constants.dart';
import 'package:notepad/core/constants/home_constants/colors.dart';
import 'package:notepad/core/constants/home_constants/string.dart';

import 'package:notepad/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

import '../core/helper/new_todo_bottom_sheet.dart';

import '../core/widgets/new_note_bottom_sheet_body_widget.dart';
import '../core/widgets/new_note_text_field.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final noteDo = Provider.of<HomeViewModel>(context);
    late HomeViewModel viewModel;
    late BuildContext _context;
    return ChangeNotifierProvider.value(
      value: viewModel = HomeViewModel(),
      builder: ((context, child) {
        _context = context;
        return Scaffold(
            appBar: custumAppBar(_context),
            floatingActionButton: addNoteButton(
              _context,
            ),
            body: Padding(
              padding: GeneralConstants().generalPadding,
              child: Column(
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  searchTextField(_context, viewModel),
                  const SizedBox(
                    height: 24,
                  ),
                  Expanded(
                    child: Center(
                      child: noteListWidget(_context),
                    ),
                  ),
                ],
              ),
            ));
      }),
    );
  }

  TextFormField searchTextField(BuildContext context, HomeViewModel viewModel) {
    return TextFormField(
      onEditingComplete: () => viewModel.searchCard(),
      controller: viewModel.searchNoteController,
      decoration: InputDecoration(
        label: Text(
          HomeStringConstants().searchLabelTitle,
          style: Theme.of(context)
              .textTheme
              .headline4!
              .copyWith(color: HomeColorConstants().searchLabelColor),
        ),
        prefixIcon: SizedBox(
          height: 10,
          width: 10,
          child: SvgIconWidget(
            path: HomeStringConstants().searchIconPath,
          ),
        ),
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: HomeColorConstants().textFieldColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: HomeColorConstants().textFieldColor,
            width: 2.0,
          ),
        ),
      ),
    );
  }

  AppBar custumAppBar(BuildContext context) {
    return AppBar(
      actions: [
        Padding(
          padding: GeneralConstants().generalPadding,
          child: SvgIconWidget(
            path: HomeStringConstants().appBarMenuIconPath,
          ),
        ),
      ],
      elevation: 0,
      title: Text(
        HomeStringConstants().appBarTitle,
        style: Theme.of(context)
            .textTheme
            .headline3!
            .copyWith(fontWeight: FontWeight.w500, color: Colors.black),
      ),
    );
  }

  FloatingActionButton addNoteButton(BuildContext _context) {
    return FloatingActionButton(
      onPressed: () {
        showNewNoteInputs(_context, NewNoteBottomSheetBodyWidget());
      },
      backgroundColor: HomeColorConstants().newCardButtonColor,
      child: Center(
        child: Icon(
          Icons.add,
          color: HomeColorConstants().newCardIconColor,
          size: 40,
        ),
      ),
    );
  }

  GridView noteListWidget(BuildContext context) {
    final noteDo = Provider.of<HomeViewModel>(context);
    return GridView.count(
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      crossAxisCount: 2,
      children: List.generate(
          noteDo.searchedTitleList.length == 0
              ? noteDo.titleList.length
              : noteDo.searchedTitleList.length,
          (index) => Consumer<HomeViewModel>(
              builder: (context, _viewModel, child) => Container(
                    decoration: BoxDecoration(
                        color: HomeColorConstants().cardColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: GeneralConstants().cardTitlesPadding,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _viewModel.searchedDateList.length == 0
                                ? _viewModel.dateList[index].toString()
                                : _viewModel.searchedDateList[index].toString(),
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: HomeColorConstants()
                                        .cardDateTitleColor),
                          ),
                          /*  IconButton(
                                icon: const Icon(Icons.close),
                                onPressed: () {
                                  _viewModel.deletTab(index);
                                })*/

                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            _viewModel.searchedTitleList.length == 0
                                ? _viewModel.titleList[index].toString()
                                : _viewModel.searchedTitleList[index]
                                    .toString(),
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Flexible(
                            child: Text(
                              "is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                      overflow: TextOverflow.fade,
                                      height: 1.25),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ))),
    );
  }
}

class SvgIconWidget extends StatelessWidget {
  final path;
  const SvgIconWidget({
    Key? key,
    this.path,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(path, fit: BoxFit.scaleDown);
  }
}
