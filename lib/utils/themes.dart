import 'package:flutter/material.dart';

class AppThemes{



  static ThemeData  light= ThemeData(
      useMaterial3: true,

      brightness: Brightness.light,
    fontFamily: 'Montserrat',
    scaffoldBackgroundColor: Color(0xFFf1f1f1)

  );

  static ThemeData  dark= ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
      fontFamily: 'Montserrat',
    scaffoldBackgroundColor: Color(0xFF111111)
  );


}