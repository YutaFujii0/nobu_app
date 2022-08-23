import 'package:flutter/material.dart';

import '../assets/global_theme.dart';
import '../domainModels/activity.dart';

class ActivityListItem extends StatelessWidget {
  const ActivityListItem(this.activity);

  final Activity activity;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          activity.datetime,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const Text(
          ' - ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: Text(
            activity.description,
            style: const TextStyle(fontWeight: FontWeight.bold),
          )
        ),
      ],
    );
  }
}