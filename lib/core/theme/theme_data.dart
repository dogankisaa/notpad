import 'package:flutter/material.dart';
import 'package:notepad/core/theme/colors.dart';
import 'package:notepad/core/theme/theme_colors.dart';

ThemeData themeData() {
    return ThemeData(
        colorScheme: themeColors(),
        scaffoldBackgroundColor: ThemeColors().scaffoldBackgroundThemeColor);
  }