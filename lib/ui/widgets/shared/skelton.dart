import 'package:flutter/material.dart';

class SkeltonWidget extends StatelessWidget {
  final double? height, width;

  const SkeltonWidget({
    super.key,
    this.height,
    this.width
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.brightness == Brightness.dark ?
                Colors.white.withOpacity(0.05) : Colors.black.withOpacity(0.05),
        ),
    );
  }
}