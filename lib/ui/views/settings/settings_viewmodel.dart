import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:test/services/app_api.dart';
import 'package:injectable/injectable.dart';
import 'package:test/app/app.locator.dart';

@lazySingleton
class SettingsViewModel extends BaseViewModel {
  final _app = locator<AppAPI>();

  bool getDarkThemeStatus() {
    return _app.getUseDarkTheme();
  }

  void setUseDarkTheme(BuildContext context, bool value) async {
    final themeManager = getThemeManager(context);

    await _app.setUseDarkTheme(value);

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarIconBrightness:
            value ? Brightness.light : Brightness.dark,
      ),
    );

    if (themeManager.isDarkMode != value) {
      themeManager.toggleDarkLightTheme();
    }
    notifyListeners();
  }
}