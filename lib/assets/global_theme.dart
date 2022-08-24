import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final global_theme_provider = StateProvider<GlobalTheme>((ref) {
  return GlobalTheme();
});

const Color customBlueGrey = Color(0xff596e7d);
const Color customLightBlue = Color(0xff0b324d);
const Color customWhite = Color(0xffe8e8e8);
const Color customLightWhite = Colors.white;

class GlobalTheme {
  final globalTheme = ThemeData(
    colorScheme: _customColorScheme,
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        fontSize: 22,
        color: customLightBlue,
      ),
      bodyText2: TextStyle(
        color: customLightBlue,
        fontSize: 18,
        fontWeight: FontWeight.bold,
        backgroundColor: customLightWhite,
      ),
      caption: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        color: customLightBlue,
        backgroundColor: customLightWhite,
      ),
      headline1: TextStyle(
        color: customLightBlue,
        fontSize: 60,
        fontFamily: 'Allison',
        fontWeight: FontWeight.bold,
      ),
      headline2: TextStyle(
        color: customLightBlue,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: customBlueGrey,
      // This will control the "back" icon
      iconTheme: IconThemeData(color: customLightBlue),
      // This will control action icon buttons that locates on the right
      actionsIconTheme: IconThemeData(color: customWhite),
      centerTitle: false,
      elevation: 15,
      titleTextStyle: TextStyle(
        color: customWhite,
        fontWeight: FontWeight.bold,
        fontFamily: 'Allison',
        fontSize: 24,
      ),
    ),
  );
}

const ColorScheme _customColorScheme = ColorScheme(
  primary: customBlueGrey,
  secondary: customLightBlue,
  surface: customBlueGrey,
  background: customWhite,
  error: Colors.redAccent,
  onPrimary: customWhite,
  onSecondary: customWhite,
  onSurface: customBlueGrey,
  onBackground: customWhite,
  onError: Colors.redAccent,
  brightness: Brightness.light,
);