import 'package:stacked/stacked.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class HomeViewModel extends BaseViewModel {
  String? currentChipLabel;
  int selectedIndex = 0;
  bool isLoading = true;

  Future<void> refreshContent() async {
    isLoading = !isLoading;
    notifyListeners();
  }

  void setCurrentChip(String chip, int index) {
    selectedIndex = index;
    currentChipLabel = chip;
    notifyListeners();
  }
}