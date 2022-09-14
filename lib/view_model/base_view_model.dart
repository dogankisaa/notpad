import 'package:flutter/material.dart';

abstract class BaseViewModel with ChangeNotifier{
  BaseViewModel(){
    init();
  }
  Future<void> init();
}