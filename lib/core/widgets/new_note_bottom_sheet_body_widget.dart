import 'package:flutter/material.dart';
import 'package:notepad/core/constants/home_constants/string.dart';
import 'package:notepad/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

import '../constants/general_constants.dart';
import '../constants/home_constants/colors.dart';
import 'new_note_text_field.dart';

class NewNoteBottomSheetBodyWidget extends StatelessWidget {
  const NewNoteBottomSheetBodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Scaffold(
        body: Padding(
          padding: GeneralConstants().generalPadding,
          child: Consumer<HomeViewModel>(
            builder: (context, _viewModel, child) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                NewNoteTextFieldWidget(
                  label: HomeStringConstants().newNoteNameInputTitle,
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Theme.of(context).colorScheme.secondary),
                  ),
                  onPressed: () {
                    _viewModel.addNewTab(context);
                  },
                  child: Text(
                    HomeStringConstants().newNoteCreateButtonTitle,
                    style: TextStyle(
                        color:
                            HomeColorConstants().newNoteCreateButtonTitleColor),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
