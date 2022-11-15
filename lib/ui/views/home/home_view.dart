import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:test/animations.dart';
import 'package:test/ui/views/home/home_viewmodel.dart';
import 'package:test/ui/widgets/shared/sliver_appbar.dart';
import 'package:test/ui/widgets/shared/raw_chip.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
     disposeViewModel: false,
     viewModelBuilder: () => HomeViewModel(),
     onModelReady: (model) => model.initialize(context),
     builder: (context, model, child) => Scaffold(
      body: RefreshIndicator(
        onRefresh: () => model.refreshContent(),
        child: CustomScrollView(
          slivers: <Widget>[
            const SliverAppBarWidget(
              title: 'Home',
            ),
            SliverPadding(
              padding: const EdgeInsets.all(8.0),
              sliver:
                SliverList(delegate: SliverChildListDelegate.fixed(
                  <Widget> [
                    SizedBox(
                      height: 40,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => RawChipWidget(
                          label: 'Category ${index + 1}',
                          isSelected: model.selectedIndex == index,
                          onSelected: (value, label) => model.setCurrentChip(label, index),
                        ),
                        separatorBuilder: (context, index) => const SizedBox(width: 10),
                        itemCount: 6,
                      ),
                    ),
                    const SizedBox(height: 14),
                    animatePageTransition(context, model.getServicesCard()),
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