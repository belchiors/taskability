import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  splashColor: Colors.transparent,
  canvasColor: white,
  cardTheme: const CardTheme(
    color: white,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    foregroundColor: darkGrey,
    elevation: 0.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: white,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark
    ),
  ),
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  splashColor: Colors.transparent,
  canvasColor: black,
  cardTheme: const CardTheme(
    color: darkGrey,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    foregroundColor: darkGrey,
    elevation: 0.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      systemNavigationBarColor: black,
      statusBarColor: black,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light),
  ),
);