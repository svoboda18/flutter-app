import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:test/ui/widgets/home/services_card.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class HomeViewModel extends BaseViewModel {
  String? currentChipLabel;
  int selectedIndex = 0;
  bool isLoading = true;

  void initialize(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 4));
    isLoading = !isLoading;
    notifyListeners();
  }

  Future<void> refreshContent() async {
    isLoading = !isLoading;
    notifyListeners();
  }

  void setCurrentChip(String chip, int index) {
    selectedIndex = index;
    currentChipLabel = chip;
    notifyListeners();
  }

  Widget getServicesCard() {
    return ServicesCardWidget(filter: currentChipLabel, isLoading: isLoading);
  }
}