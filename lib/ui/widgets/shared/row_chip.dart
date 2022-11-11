import 'package:flutter/material.dart';

class RawChipWidget extends StatelessWidget {
  final String label;
  final bool isSelected;
  final Function(bool, String)? onSelected;

  const RawChipWidget({
    super.key,
    required this.label,
    required this.isSelected,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return RawChip(
      showCheckmark: false,
      label: Text(label),
      selected: isSelected,
      labelStyle: Theme.of(context).textTheme.subtitle2!.copyWith(
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.w500,
          ),
      backgroundColor: Colors.transparent,
      selectedColor: Theme.of(context).colorScheme.secondaryContainer,
      padding: const EdgeInsets.all(10),
      onSelected: ((value) => onSelected!(value, label)),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: isSelected
            ? BorderSide.none
            : BorderSide(
                width: 0.2,
                color: Theme.of(context).colorScheme.secondary,
              ),
      ),
    );
  }
}