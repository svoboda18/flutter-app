import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:test/services/app_api.dart';

import 'package:test/ui/views/home/home_view.dart';
import 'package:test/ui/views/home/home_viewmodel.dart';

import 'package:test/ui/views/profile/profile_view.dart';
import 'package:test/ui/views/profile/profile_viewmodel.dart';

import 'package:test/ui/views/navigation/navigation_view.dart';
import 'package:test/ui/views/navigation/navigation_viewmodel.dart';

import 'package:test/ui/views/settings/settings_view.dart';
import 'package:test/ui/views/settings/settings_viewmodel.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: NavigationView),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: ProfileView),
    MaterialRoute(page: SettingsView)
  ],
  dependencies: [
    LazySingleton(classType: HomeViewModel),
    LazySingleton(classType: NavigationViewModel),
    LazySingleton(classType: ProfileViewModel),
    LazySingleton(classType: SettingsViewModel),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: AppAPI)
  ],
)
class AppSetup {}