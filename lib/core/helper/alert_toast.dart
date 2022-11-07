import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

alertToast(errorTitle, context) {
  MotionToast.error(title: Text("Error"), description: Text(errorTitle))
      .show(context);
}
