import 'package:flutter/material.dart';
import 'package:notepad/core/theme/colors.dart';

ColorScheme colorTheme() {
  return ColorScheme(
      brightness: Brightness.light,
      primary: ThemeColors().scaffoldBackgroundThemeColor,
      onPrimary: ThemeColors().onPrimaryThemeColor,
      secondary: ThemeColors().secondaryThemeColor,
      onSecondary: ThemeColors().onSecondaryThemeColor,
      error: ThemeColors().errorThemeColor,
      onError: ThemeColors().onErrorThemeColor,
      background: ThemeColors().scaffoldBackgroundThemeColor,
      onBackground: ThemeColors().onSecondaryThemeColor,
      surface: ThemeColors().scaffoldBackgroundThemeColor,
      onSurface: ThemeColors().onPrimaryThemeColor);
}
