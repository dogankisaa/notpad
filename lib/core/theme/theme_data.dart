import 'package:flutter/material.dart';
import 'package:notepad/core/theme/colors.dart';
import 'package:notepad/core/theme/text_theme.dart';
import 'package:notepad/core/theme/theme_colors.dart';

ThemeData themeData() {
  return ThemeData(
      fontFamily: "Regular",
      textTheme: textTheme(),
      colorScheme: colorTheme(),
      scaffoldBackgroundColor: ThemeColors().scaffoldBackgroundThemeColor);
}
