import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:notepad/core/helper/alert_toast.dart';
import 'package:notepad/core/helper/notification.dart';

pickDate(context, title) {
  DatePicker.showDateTimePicker(context,
          showTitleActions: true,
          minTime: DateTime.now(),
          maxTime: DateTime(2100), onChanged: (date) {
    print('change $date');
  }, onConfirm: (date) {
    print('confirm $date');
    return date;
  }, currentTime: DateTime.now(), locale: LocaleType.en)
      .then((value) {
    print(value!.minute);
    value!.minute == DateTime.now().minute
        ? alertToast("Minute must be different from the current time!", context)
        : reminder(title, value);
  });
}
