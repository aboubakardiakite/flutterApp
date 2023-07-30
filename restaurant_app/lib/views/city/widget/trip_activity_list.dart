import 'package:flutter/material.dart';
import 'package:restaurant_app/views/city/widget/trip_activity_card.dart';

import '../../../models/activity.model.dart';

class TripActivityList extends StatelessWidget {

  List<Activity> activities;
  final Function deleteTripActivity;


  TripActivityList({super.key, required this.activities,required this.deleteTripActivity});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        var activity = activities[index];
        return TripActivityCard(activity: activity,deleteTripActivity: deleteTripActivity);
      },
      itemCount: activities.length,
    );
  }
}
