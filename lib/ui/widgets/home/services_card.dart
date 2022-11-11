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
    return SliverToBoxAdapter(
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: !isLoading ? [
          ServiceCardWidget(filter: filter),
          const SizedBox(width: 10),
        ] :
        const [
          SkeltonWidget(height: 36, width: 36),
          SizedBox(height: 10),
          SkeltonWidget(height: 12),
        ],
      )
    );
  }
}