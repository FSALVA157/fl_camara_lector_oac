import 'package:flutter/material.dart';

class GlobalTheme{
  static final primary = Colors.amber[800];

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: primary,
     scaffoldBackgroundColor: Colors.white,
    appBarTheme:  AppBarTheme(
      color: primary,
      elevation: 0
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: primary
      )
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primary
    )    

  );


}