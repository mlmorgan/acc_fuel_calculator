import 'package:flutter/material.dart';
import '../providers/litres_required.dart';
import 'package:provider/provider.dart';

class LitresRequiredWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<LitresRequired>(builder: (ctx, litresRequired, _) {
      return Column(
        children: [
          Text(
            'Recommended',
            style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            litresRequired.recommended.toString(),
            style: Theme.of(context).textTheme.headline1,
          ),
          // SizedBox(
          //   height: 16,
          // ),
          Divider(
            thickness: 1,
          ),
          SizedBox(
            height: 24,
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: SmallLitresRequiredColumn(
                    title: 'Minimum', litres: litresRequired.minimum),
              ),
              Container(
                width: 1,
                height: 72,
                color: Theme.of(context).dividerColor,
              ),
              Expanded(
                child: SmallLitresRequiredColumn(
                  title: 'Safe',
                  litres: litresRequired.safe,
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
  final int litres;

  const SmallLitresRequiredColumn({
    Key? key,
    required this.title,
    required this.litres,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        Text(
          litres.toString(),
          style: Theme.of(context).textTheme.headline4,
        ),
      ],
    );
  }
}
