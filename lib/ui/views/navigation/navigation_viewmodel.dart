import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_themes/stacked_themes.dart';

import 'package:injectable/injectable.dart';

@lazySingleton
class NavigationViewModel extends IndexTrackingViewModel {

  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return const HomeView();
      default:
        return const HomeView();
    }
  }
}