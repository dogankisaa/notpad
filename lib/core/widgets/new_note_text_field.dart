import 'package:flutter/material.dart';
import 'package:notepad/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

class NewNoteTextFieldWidget extends StatelessWidget {
  final String label;
  const NewNoteTextFieldWidget({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Consumer<HomeViewModel>(
        builder: (context, viewModel, child) => TextFormField(
              controller: viewModel.newNoteLabelController,
              decoration: InputDecoration(
                hintText: label,
              ),
            ));
  }
}
