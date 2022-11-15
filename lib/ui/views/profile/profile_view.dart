import 'package:flutter/material.dart';
import 'package:test/ui/views/profile/profile_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:injectable/injectable.dart';
import 'package:test/ui/widgets/shared/sliver_appbar.dart';

@lazySingleton
class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
      viewModelBuilder: () => ProfileViewModel(),
      builder: (context, ProfileViewModel model, child) => Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBarWidget(
              title: 'Profile',
              actions: [
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: const Icon(Icons.settings),
                    onPressed: () => model.gotoSettings(),
                    color: Theme.of(context).textTheme.headline6!.color,
                  ),
                ),
              ],
            ),
          ]
        ),
      ),
    );
  }
}