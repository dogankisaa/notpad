import 'package:flutter/material.dart';

void showNewNoteInputs(BuildContext context, Widget noteInputs) {
  showModalBottomSheet(
    context: context,
    builder: (context) => noteInputs,
  );
}
