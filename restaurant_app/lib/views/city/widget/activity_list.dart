import 'package:flutter/material.dart';

import '../../../models/activity.model.dart';
import 'activity_card.dart';

class ActivityList extends StatelessWidget {
  final List<Activity> activities;
  final List<String> selectedActivities;
  final Function toggleActivity;


  ActivityList({super.key, required this.activities, required this.selectedActivities,required this.toggleActivity});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 2,
        children: activities.map(
                (activity) => ActivityCard(
                        activity: activity,
                        isSelected: selectedActivities.contains(activity.id),
                        toggleActivity: (){
                          toggleActivity(activity.id);
                        }
                  )
              ).toList());
  }
}
