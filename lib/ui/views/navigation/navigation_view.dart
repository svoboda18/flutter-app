import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:test/animations.dart';

import 'package:test/ui/views/navigation/navigation_viewmodel.dart';

import 'package:injectable/injectable.dart';

@lazySingleton
class NavigationView extends StatelessWidget {
  const NavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NavigationViewModel>.reactive(
      viewModelBuilder: () => NavigationViewModel(),
      onModelReady: (model) => model.initialize(context),
      builder: (context, model, child) => Scaffold(
        body: animatePageTransition(context, model.getViewForIndex(model.currentIndex)),
        bottomNavigationBar: NavigationBar(
            onDestinationSelected: model.setIndex,
            selectedIndex: model.currentIndex,
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            destinations: const <Widget> [
              NavigationDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.article_outlined),
                selectedIcon: Icon(Icons.article),
                label: 'Services',
              ),
              NavigationDestination(
                icon: Icon(Icons.search_outlined),
                selectedIcon: Icon(Icons.search),
                label: 'Search',
              ),
              NavigationDestination(
                icon: Icon(Icons.chat_outlined),
                selectedIcon: Icon(Icons.chat),
                label: 'Chat',
              ),
              NavigationDestination(
                icon: Icon(Icons.account_circle_outlined),
                selectedIcon: Icon(Icons.account_circle),
                label: 'Account',
              ),
            ],
        ),
      ), 
    );
  }
}