import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_themes/stacked_themes.dart';

import 'package:test/ui/views/home/home_view.dart';
import 'package:test/ui/views/profile/profile_view.dart';
import 'package:injectable/injectable.dart';
// ignore: depend_on_referenced_packages
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class NavigationViewModel extends IndexTrackingViewModel {
  late ThemeManager themeManager;

  void initialize(BuildContext context) async {
    themeManager = getThemeManager(context);
    final prefs = await SharedPreferences.getInstance();
  
    if (prefs.getBool('useDarkTheme') == null) {
      bool isDark =
          MediaQuery.of(context).platformBrightness != Brightness.light;
      await prefs.setBool('useDarkTheme', isDark);
      if (isDark && !themeManager.isDarkMode) themeManager.toggleDarkLightTheme();
    }
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness:
            themeManager.isDarkMode ? Brightness.dark : Brightness.light,
      ),
    );
  }

  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return const HomeView();
      case 4:
        return const ProfileView();
      default:
        return const HomeView();
    }
  }
}