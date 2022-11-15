import 'package:stacked/stacked.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:test/app/app.locator.dart';
import 'package:test/app/app.router.dart';

@lazySingleton
class ProfileViewModel extends BaseViewModel {
  final NavigationService navigatorService = locator<NavigationService>();

  Future<void> gotoSettings() async {
    await navigatorService.navigateToSettingsView();
  }
}