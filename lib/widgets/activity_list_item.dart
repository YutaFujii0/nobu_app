import 'package:flutter/material.dart';

import '../domainModels/activity.dart';

class ActivityListItem extends StatelessWidget {
  const ActivityListItem(this.activity);

  final Activity activity;

  @override
  Widget build(BuildContext context) {
    return Text(
      '${activity.datetime} - ${activity.description}',
      style: Theme
          .of(context)
          .textTheme
          .headline4,
    );
  }
}