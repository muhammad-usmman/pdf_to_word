// theme_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:pdf_to_word/utils/themes.dart';
import 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(themeData: AppThemes.light));

  void toggleTheme() {
    final isLightTheme = state.themeData == AppThemes.light;
    emit(ThemeState(themeData: isLightTheme ? AppThemes.light : AppThemes.light));
  }
}
