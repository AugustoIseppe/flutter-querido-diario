import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:querido_diario/app/utils/themes.dart';

part 'theme_mode_state.dart';

class ThemeModeCubit extends Cubit<ThemeModeState> {
  ThemeModeCubit() : super(ThemeModeDark(darkTheme));

  void switchToLight() {
    emit(ThemeModeLight(lightTheme));
  }

  void switchToDark() {
    emit(ThemeModeDark(darkTheme));
  }

  void switchToCustomTheme(Color color) {
    final customTheme = colorThemes[color];
    if (customTheme != null) {
      emit(ThemeModeCustom(theme: customTheme, selectedColor: color));
    }
  }

  void toggleTheme() {
    if (state is ThemeModeLight) {
      switchToDark();
    } else if (state is ThemeModeDark) {
      switchToLight();
    } else {
      // Se estiver em tema custom, volta para dark
      switchToDark();
    }
  }

  // Getter para pegar o tema atual
  Map<String, dynamic> get currentTheme {
    if (state is ThemeModeLight) {
      return (state as ThemeModeLight).theme;
    } else if (state is ThemeModeDark) {
      return (state as ThemeModeDark).theme;
    } else if (state is ThemeModeCustom) {
      return (state as ThemeModeCustom).theme;
    }
    return darkTheme; // fallback
  }

  // Getter para pegar a cor selecionada
  Color? get selectedColor {
    if (state is ThemeModeCustom) {
      return (state as ThemeModeCustom).selectedColor;
    }
    return null;
  }
}