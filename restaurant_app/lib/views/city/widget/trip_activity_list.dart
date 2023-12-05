import 'package:flutter/material.dart';
import 'package:restaurant_app/views/city/widget/trip_activity_card.dart';

import '../../../models/activity_model.dart';

class TripActivityList extends StatelessWidget {

  List<Activity> activities;
  final Function deleteTripActivity;


  TripActivityList({super.key, required this.activities,required this.deleteTripActivity});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
      children: activities.map((activity) => TripActivityCard(
                          key: ValueKey(activity.id),
                          activity: activity,
                          deleteTripActivity: deleteTripActivity)
      ).toList())
    );
  }
}
