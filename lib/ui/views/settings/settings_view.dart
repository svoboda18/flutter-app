import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:test/ui/views/settings/settings_viewmodel.dart';
import 'package:test/ui/widgets/settings/section.dart';
import 'package:test/ui/widgets/shared/sliver_appbar.dart';
import 'package:test/ui/widgets/shared/switch_tile.dart';

import 'package:injectable/injectable.dart';

const settingsDivider =
      Divider(thickness: 1.0, indent: 20.0, endIndent: 20.0);

@lazySingleton
class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsViewModel>.reactive(
      viewModelBuilder: () => SettingsViewModel(),
      builder: (context, model, child) => Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            const SliverAppBarWidget(
              hasBackArrow: true,
              title: 'Settings'
            ),
            SliverList(
              delegate: SliverChildListDelegate.fixed(
                <Widget>[
                  SectionWidget(
                    title: 'Appearance',
                    children: <Widget>[
                      SwitchWidgetTile(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        title: const Text(
                            'Theme',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                        ),
                        subtitle: const Text('Switch to Dark mode'),
                        value: model.getDarkThemeStatus(),
                        onTap: (value) => model.setUseDarkTheme(
                          context,
                          value,
                        ),
                      ),
                    ],
                  ),
                  settingsDivider,
                ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}