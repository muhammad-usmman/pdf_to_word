import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xFFD32F2F),
    primaryColorLight: Colors.white,
    // colorScheme: ColorScheme.fromSeed(
    //   brightness: Brightness.dark,
    //   seedColor: Colors.white,
    //   primary: const Color(0xFFD32F2F),
    //   secondary: Colors.white,
    //   // tertiary: AppColors.white,
    //   // surface: AppColors.primaryBackground,
    // ),

    cardColor: Colors.white,
    scaffoldBackgroundColor: const Color(0xFFF1F1F1),
    // Light gray background
    fontFamily: 'Montserrat',
    // As mentioned in the existing design
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    // textTheme: const TextTheme(
    //   bodyLarge: TextStyle(color: Colors.black, fontSize: 16),
    //   bodyMedium: TextStyle(color: Colors.black54, fontSize: 14),
    //   bodySmall: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    // ),
    cardTheme: CardTheme(
      color: Colors.white, // Card background color
      elevation: 4.0, // Shadow depth
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0), // Rounded corners
      ),
      margin: const EdgeInsets.all(8.0), // Default margin for all cards
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFD32F2F), // Red button
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    ),
    dividerColor: Colors.grey,
    scrollbarTheme: const ScrollbarThemeData(
      thumbColor: WidgetStatePropertyAll(Color(0xFFD32F2F)),
    ),
  );

  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF1A1A1A),
    // Red accent
    primaryColorLight: Colors.black,

    scaffoldBackgroundColor: const Color(0xFF121212),
    // Dark gray background
    fontFamily: 'Montserrat',
    // As mentioned in the existing design
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1E1E1E), // Slightly lighter black
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white, fontSize: 16),
      bodyMedium: TextStyle(color: Colors.white70, fontSize: 14),
      bodySmall: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFD32F2F), // Red button
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    ),
    cardColor:const Color(0xff303030),
    cardTheme: CardTheme(
      color: const Color(0xff303030),
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      margin: const EdgeInsets.all(8.0),
    ),
    dividerColor: Colors.white70,
    scrollbarTheme: const ScrollbarThemeData(
      thumbColor: WidgetStatePropertyAll(Color(0xFFD32F2F)),
    ),
  );
}
