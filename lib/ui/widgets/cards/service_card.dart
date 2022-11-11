import 'package:flutter/material.dart';
import 'package:test/ui/widgets/shared/card.dart';

class ServiceCardWidget extends StatelessWidget {
  const ServiceCardWidget({
    super.key,
    this.filter
  });
  final String? filter;

  @override
  Widget build(BuildContext context) {
    return CardWidget(
        child: Center(
          child: Column(
            children: <Widget> [
              Icon(size: 36, Icons.shopping_basket_rounded, color: Theme.of(context).colorScheme.secondary),
              const SizedBox(height: 12),
              Text('Item $filter', textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: Theme.of(context).colorScheme.secondary
                )
              ),
            ]
          ),
        ),
    );
  }
}