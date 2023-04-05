import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/litres_required.dart';

class LitresRequiredWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<LitresRequired>(builder: (ctx, litresRequired, _) {
      return Column(
        children: [
          Text(
            'Recommended',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Text(
            litresRequired.recommended.toString(),
            style: Theme.of(context).textTheme.displayLarge,
          ),
          Text(
            '1 lap reserve',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(
            height: 24,
          ),
          Divider(
            thickness: 1,
          ),
          SizedBox(
            height: 24,
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: SmallLitresRequiredColumn(
                    title: 'Minimum',
                    subtitle: 'No reserve',
                    litres: litresRequired.minimum,
                  ),
                ),
              ),
              Container(
                width: 1,
                height: 72,
                color: Theme.of(context).dividerColor,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: SmallLitresRequiredColumn(
                    title: 'Safe',
                    subtitle: '2 laps reserve',
                    litres: litresRequired.safe,
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    });
  }
}

class SmallLitresRequiredColumn extends StatelessWidget {
  final String title;
  final String subtitle;
  final int litres;

  const SmallLitresRequiredColumn({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.litres,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          litres.toString(),
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          subtitle,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
