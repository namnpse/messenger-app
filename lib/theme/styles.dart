import 'package:flutter/material.dart';

class Styles {

  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      // primarySwatch: Colors.red,
      primarySwatch: Colors.blue,
      primaryColor: isDarkTheme ? Colors.white : Colors.black,

      backgroundColor: isDarkTheme ? Colors.black : Colors.white,

      indicatorColor: isDarkTheme ? const Color(0xff0E1D36) : const Color(0xffCBDCF8),
      buttonColor: isDarkTheme ? const Color(0xff3B3B3B) : const Color(0xffF1F5FB),

      // hintColor: isDarkTheme ? Color(0xff280C0B) : Color(0xffEECED3),
      hintColor: isDarkTheme ? Colors.white : Colors.black,

      // highlightColor: isDarkTheme ? Color(0xff372901) : Color(0xffFCE192),
      highlightColor: isDarkTheme ? Colors.blue : Colors.white,
      hoverColor: isDarkTheme ? const Color(0xff3A3A3B) : const Color(0xff4285F4),

      // focusColor: isDarkTheme ? Color(0xff0B2512) : Color(0xffA8DAB5),
      focusColor: isDarkTheme ? const Color(0xff0B2512) : Colors.white,
      // disabledColor: const Color(0xff3A3B3F),
      disabledColor: isDarkTheme ? const Color(0xff3A3B3F) : Colors.grey.withAlpha(30),
      // textSelectionColor: isDarkTheme ? Colors.white : Colors.black,
      cardColor: isDarkTheme ? const Color(0xFF151515) : Colors.white,
      canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme ? const ColorScheme.dark() : const ColorScheme.light()),
      appBarTheme: const AppBarTheme(
        elevation: 0.0,
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold, color: isDarkTheme ? Colors.white : Colors.black),
        // titleLarge: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        titleLarge: const TextStyle(fontSize: 36.0, fontStyle: FontStyle.normal),
        bodyMedium: const TextStyle(fontSize: 14.0),
      ),
    );

  }
}