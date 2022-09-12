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
    late BuildContext _context;
    late HomeViewModel _viewModel;
    return ChangeNotifierProvider.value(
      value: _viewModel = HomeViewModel(),
      builder: ((context, child) {
        _context = context;
        return Scaffold(
            floatingActionButton: addNoteButton(_context, _viewModel),
            body: Text(_viewModel.getNoteList.toString()));
      }),
    );
  }

  FloatingActionButton addNoteButton(
      BuildContext _context, HomeViewModel _viewModel) {
    return FloatingActionButton(
      onPressed: () {
        _viewModel.showNewNoteInputs(
            _context,
            NewNoteBottomSheetBodyWidget());
     
      },
      child: const Center(
        child: Icon(Icons.add),
      ),
    );
  }

  Consumer noteListWidget() {
    return Consumer<HomeViewModel>(
      builder: (context, _viewModel, child) {
        return Text(_viewModel.getNoteList.toString());
      },
    );
  }
}


