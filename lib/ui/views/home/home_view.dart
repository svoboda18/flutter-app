import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:stacked/stacked.dart';
import 'package:test/ui/views/home/home_viewmodel.dart';
import 'package:test/ui/widgets/home/services_card.dart';
import 'package:test/ui/widgets/shared/sliver_appbar.dart';
import 'package:test/ui/widgets/shared/row_chip.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
     disposeViewModel: false,
     viewModelBuilder: () => HomeViewModel(),
     builder: (context, model, child) => Scaffold(
      body: RefreshIndicator(
        onRefresh: () => model.refreshContent(),
        child: CustomScrollView(
          slivers: <Widget>[
            const SliverAppBarWidget(
              isMainView: true,
              title: 'Home',
            ),
            SliverPadding(
              padding: const EdgeInsets.all(8.0),
              sliver:
                SliverList(delegate: SliverChildListDelegate(
                  <Widget> [
                    Row(
                      children: [
                        RawChipWidget(
                          label: 'Category 1',
                          isSelected: model.selectedIndex == 0,
                          onSelected: (value, label) => model.setCurrentChip(label, 0),
                        ),
                        const SizedBox(width: 10),
                        RawChipWidget(
                          label: 'Category 2',
                          isSelected:  model.selectedIndex == 1,
                          onSelected: (value, label) => model.setCurrentChip(label, 1),
                        ),
                        const SizedBox(width: 10),
                        RawChipWidget(
                          label: 'Category 3',
                          isSelected:  model.selectedIndex == 2,
                          onSelected: (value, label) => model.setCurrentChip(label, 2),
                        ),
                        const SizedBox(width: 10),
                        RawChipWidget(
                          label: 'Category 4',
                          isSelected:  model.selectedIndex == 3,
                          onSelected: (value, label) => model.setCurrentChip(label, 3),
                        ),
                        PageTransitionSwitcher(
                          transitionBuilder: (child, primaryAnimation, secondaryAnimation) => FadeThroughTransition(
                              animation: primaryAnimation,
                              secondaryAnimation: secondaryAnimation,
                              fillColor: Colors.transparent,
                              child: child,
                          ),
                          layoutBuilder: (entries) {
                            return Stack(
                              alignment: Alignment.center,
                              children: entries,
                            );
                          },
                          child: ServicesCardWidget(filter: model.currentChipLabel, isLoading: model.isLoading),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ]
        )
      )
     )
    );
  }
}