import 'package:flutter/material.dart';

import 'package:notepad/core/constants/general_constants.dart';
import 'package:notepad/core/constants/home_constants.dart';
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
    late BuildContext _context;
    late HomeViewModel viewModel;
    return ChangeNotifierProvider.value(
      value: viewModel = HomeViewModel(),
      builder: ((context, child) {
        _context = context;
        return Scaffold(
            floatingActionButton: addNoteButton(
              _context,
            ),
            body: Center(child: noteListWidget(_context)));
      }),
    );
  }

  FloatingActionButton addNoteButton(BuildContext _context) {
    return FloatingActionButton(
      onPressed: () {
        showNewNoteInputs(_context, NewNoteBottomSheetBodyWidget());
      },
      child: const Center(
        child: Icon(Icons.add),
      ),
    );
  }

  GridView noteListWidget(BuildContext _context) {
    final noteDo = Provider.of<HomeViewModel>(_context);
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(
          noteDo.noteList.length,
          (index) => Consumer<HomeViewModel>(
                builder: (context, _viewModel, child) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                            child: Align(
                                alignment: Alignment.topRight,
                                child: IconButton(
                                    icon: const Icon(Icons.close),
                                    onPressed: () {
                                      _viewModel.deletTab(index);
                                    }))),
                        Expanded(
                          child: Center(
                            child: Center(
                              child:
                                  Text(_viewModel.noteList[index].toString()),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
    );
  }
}
