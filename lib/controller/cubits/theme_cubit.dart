// theme_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:pdf_to_word/utils/prefrences/user_prefs.dart';
import 'package:pdf_to_word/utils/themes.dart';
import 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(themeData: UserPrefs.getTheme()?AppThemes.light:AppThemes.dark));

  void toggleTheme() {
    final isLightTheme = state.themeData == AppThemes.light;
    UserPrefs.setTheme(isLightTheme?false:true);
    emit(ThemeState(themeData: isLightTheme ? AppThemes.dark : AppThemes.light));
  }

}
