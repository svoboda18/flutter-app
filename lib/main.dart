import 'package:flutter/material.dart';
import 'theme.dart';

// ignore: unused_import
import 'package:test/app/app.dart';
import 'package:test/app/app.locator.dart';
import 'package:test/ui/views/navigation/navigation_view.dart';
import 'package:test/services/app_api.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

Future main() async {
  await ThemeManager.initialise();
  await setupLocator();
  await locator<AppAPI>().initialize();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      defaultThemeMode: ThemeMode.system,
      darkTheme: darkCustomTheme,
      lightTheme: lightCustomTheme,
      builder: (context, regularTheme, darkTheme, themeMode) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Test',
        theme: lightCustomTheme,
        darkTheme: darkCustomTheme,
        themeMode: themeMode,
        navigatorKey: StackedService.navigatorKey,
        home: const NavigationView(),
      ),
    );
  }
}
