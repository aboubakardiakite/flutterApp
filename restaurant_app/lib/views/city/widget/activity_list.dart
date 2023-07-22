import 'package:flutter/material.dart';

import '../../../models/activity.model.dart';
import 'activity_card.dart';

class ActivityList extends StatelessWidget {
  final List<Activity> activities;


  ActivityList({super.key, required this.activities});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 2,
        children: activities.map((activity) => ActivityCard(activity: activity)
        ).toList());
  }
}
