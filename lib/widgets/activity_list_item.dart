import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../domainModels/activity.dart';

class ActivityListItem extends StatelessWidget {
  const ActivityListItem(this.activity);

  final Activity activity;

  String timeFormat(activity) {
    final DateFormat formatter = DateFormat('hh:mm');
    return formatter.format(DateTime.fromMillisecondsSinceEpoch(activity.actionAt));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          timeFormat(activity),
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