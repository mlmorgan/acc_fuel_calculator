import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../models/car/group.dart';
import '../providers/category.dart';

class CategorySelector extends StatelessWidget {
  final Map<Group, Widget> myTabs = const <Group, Widget>{
    Group.gt3: Text("GT3"),
    Group.gt4: Text("GT4")
  };

  @override
  Widget build(BuildContext context) {
    return Consumer<Category>(builder: (ctx, category, _) {
      return Container(
        width: double.infinity,
        child: CupertinoSlidingSegmentedControl(
          // backgroundColor: Theme.of(context).primaryColorLight,
          groupValue: category.category,
          children: myTabs,
          onValueChanged: (Group? newCategory) {
            if (newCategory != null) {
              category.setCategory(newCategory);
            }
          },
        ),
      );
    });
  }
}
