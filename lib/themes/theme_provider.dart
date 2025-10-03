import 'package:chatapp/themes/dark_mode.dart';
import 'package:chatapp/themes/light_mode.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = _applyFont(lightmode);
  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == _applyFont(darkmode);

  set themeData(ThemeData themeData) {
    // ✅ Always apply Poppins font
    _themeData = _applyFont(themeData);
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == _applyFont(lightmode)) {
      themeData = darkmode;
    } else {
      themeData = lightmode;
    }
  }

  // Helper: Apply Poppins globally to any theme
  static ThemeData _applyFont(ThemeData baseTheme) {
    return baseTheme.copyWith(
      textTheme: GoogleFonts.poppinsTextTheme(baseTheme.textTheme),
    );
  }
}
