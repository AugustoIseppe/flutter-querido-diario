part of 'theme_mode_cubit.dart';

abstract class ThemeModeState {}

class ThemeModeInitial extends ThemeModeState {}

class ThemeModeLight extends ThemeModeState {
  final Map<String, dynamic> theme;
  
  ThemeModeLight(this.theme);
}

class ThemeModeDark extends ThemeModeState {
  final Map<String, dynamic> theme;
  
  ThemeModeDark(this.theme);
}

class ThemeModeCustom extends ThemeModeState {
  final Map<String, dynamic> theme;
  final Color selectedColor;
  
  ThemeModeCustom({required this.theme, required this.selectedColor});
}
