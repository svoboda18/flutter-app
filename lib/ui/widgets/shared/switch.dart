import 'package:flutter/material.dart';

class SwitchWidget extends StatelessWidget {
  final ValueChanged<bool> onChanged;
  final bool value;
  const SwitchWidget({
    super.key,
    required this.onChanged,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    Color? activeColor = Theme.of(context).colorScheme.tertiary;
    Color? inactiveColor = Theme.of(context).colorScheme.secondary;
    return GestureDetector(
      onTap: () {
        onChanged(!value);
      },
      child: SizedBox(
        height: 25,
        width: 50,
        child: Stack(
          children: [
            AnimatedContainer(
              height: 25,
              width: 50,
              curve: Curves.ease,
              duration: const Duration(milliseconds: 500),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(25.0),
                ),
                color: value ? activeColor : inactiveColor,
              ),
            ),
            AnimatedAlign(
              curve: Curves.ease,
              duration: const Duration(milliseconds: 500),
              alignment: value ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                height: 20,
                width: 20,
                margin: const EdgeInsets.symmetric(horizontal: 3),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12.withOpacity(0.1),
                      spreadRadius: 0.5,
                      blurRadius: 1,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}