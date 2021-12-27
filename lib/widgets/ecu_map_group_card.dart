import 'package:flutter/material.dart';

import '../models/ecu_profile/ecu_profile.dart';

class EcuMapGroupCard extends StatelessWidget {
  final EcuMapGroup ecuMapGroup;

  const EcuMapGroupCard({Key? key, required this.ecuMapGroup})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                color: ecuMapGroup.color,
                borderRadius: BorderRadius.vertical(top: Radius.circular(4.0))),
            width: double.infinity,
            child: Text(
              ecuMapGroup.name.toUpperCase(),
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.separated(
              itemBuilder: (context, index) => Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(ecuMapGroup.maps[index].number.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      )),
                  SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      ecuMapGroup.maps[index].description,
                      // textAlign: TextAlign.center,
                      // style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
              separatorBuilder: (context, index) => Divider(),
              itemCount: ecuMapGroup.maps.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
            ),
          ),
        ],
      ),
    );
  }
}
