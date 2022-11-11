import 'package:flutter/material.dart';
import 'package:test/ui/widgets/shared/switch.dart';

class SwitchWidgetTile extends StatelessWidget {
  final Widget title;
  final Widget subtitle;
  final bool value;
  final Function(bool) onTap;
  final EdgeInsetsGeometry? padding;

  const SwitchWidgetTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onTap,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: padding ?? EdgeInsets.zero,
      title: title,
      subtitle: subtitle,
      onTap: () => onTap(!value),
      trailing: SwitchWidget(
        value: value,
        onChanged: onTap,
      ),
    );
  }
}