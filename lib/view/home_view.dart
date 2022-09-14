import 'package:flutter/material.dart';

import 'package:notepad/core/constants/general_constants.dart';
import 'package:notepad/core/constants/home_constants.dart';
import 'package:notepad/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

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
            floatingActionButton: addNoteButton(_context, viewModel),
            body: Center(child: noteListWidget(noteDo.noteList)));
      }),
    );
  }

  FloatingActionButton addNoteButton(
      BuildContext _context, HomeViewModel _viewModel) {
    return FloatingActionButton(
      onPressed: () {
        _viewModel.showNewNoteInputs(_context, NewNoteBottomSheetBodyWidget());
      },
      child: const Center(
        child: Icon(Icons.add),
      ),
    );
  }

  GridView noteListWidget(title) {
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(
          title.length,
          (index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(title[index].toString()),
                  ),
                ),
              )),
    );
  }
}
