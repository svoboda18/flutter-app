import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var lightCustomColorScheme = ColorScheme.fromSeed(
  seedColor: Colors.blue,
  brightness: Brightness.light,
  primary: const Color.fromARGB(255, 119, 169, 240),
);

var lightCustomTheme = ThemeData(
  useMaterial3: true,
  colorScheme: lightCustomColorScheme,
  navigationBarTheme: NavigationBarThemeData(
    labelTextStyle: MaterialStateProperty.all(
      TextStyle(
        color: lightCustomColorScheme.secondary,
        fontWeight: FontWeight.w500,
      ),
    ),
  ),
  textTheme: GoogleFonts.robotoTextTheme(ThemeData.light().textTheme),
);

var darkCustomColorScheme = ColorScheme.fromSeed(
  seedColor: Colors.blue,
  brightness: Brightness.dark,
  primary: const Color.fromARGB(255, 108, 161, 236),
  surface: const Color(0xff1B1A1D),
  tertiary: const Color.fromARGB(255, 82, 96, 219),
);

var darkCustomTheme = ThemeData(
  useMaterial3: true,
  colorScheme: darkCustomColorScheme,
  navigationBarTheme: NavigationBarThemeData(
    labelTextStyle: MaterialStateProperty.all(
      TextStyle(
        color: darkCustomColorScheme.secondary,
        fontWeight: FontWeight.w500,
      ),
    ),
  ),
  canvasColor: const Color(0xff1B1A1D),
  scaffoldBackgroundColor: const Color(0xff1B1A1D),
  toggleableActiveColor: const Color(0xffA5CAFF),
  textTheme: GoogleFonts.robotoTextTheme(ThemeData.dark().textTheme),
);