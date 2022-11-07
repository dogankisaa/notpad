import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class BaseViewModel with ChangeNotifier {
  BaseViewModel() {
    init();
  }
  Future<void> init();
}
