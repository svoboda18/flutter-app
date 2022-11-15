import 'package:flutter/material.dart';
import 'package:test/ui/widgets/cards/service_card.dart';
import 'package:test/ui/widgets/shared/skelton.dart';

class ServicesCardWidget extends StatelessWidget {
  const ServicesCardWidget({
    super.key,
    required this.isLoading,
    this.filter,
  });
  final String? filter;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) => !isLoading ? ServiceCardWidget(filter: '$filter: $index') :
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: const <Widget> [
                  SkeltonWidget(height: 70, width: 120),
                  SizedBox(height: 8),
                  SkeltonWidget(height: 12, width: 80),
                ],
              ),
            ),
          ),
        itemCount: 5,
      )
    );
  }
}