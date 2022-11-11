import 'package:flutter/material.dart';
import 'package:test/ui/views/profile/profile_viewmodel.dart';
import 'package:test/ui/views/settings/settings_view.dart';

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
              isMainView: true,
              title: 'Profile',
              actions: [
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () => Navigator.push(context, MaterialPageRoute(
                        builder: (context) => const SettingsView()
                      ),
                    ),
                    color: Theme.of(context).colorScheme.brightness == Brightness.dark ?
                           Colors.white : Colors.black,
                    icon: const Icon(Icons.settings),
                  ),
                )
              ],
            ),
          ]
        ),
      ),
    );
  }
}