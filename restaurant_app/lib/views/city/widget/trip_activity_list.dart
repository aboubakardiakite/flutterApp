import 'package:flutter/material.dart';

import '../../../models/activity.model.dart';
import 'activity_card.dart';

class TripActivityList extends StatelessWidget {

  List<Activity> activities;
  final Function deleteTripActivity;


  TripActivityList({super.key, required this.activities,required this.deleteTripActivity});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        var activity = activities[index];
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(activity.image),
            ),
            title: Text(activity.name),
            trailing:  IconButton(
                            icon: Icon(Icons.delete),
                            color: Colors.red,
                            onPressed: (){
                              deleteTripActivity(activity.id);
                            }
            ),
          ),
        );
      },
      itemCount: activities.length,
    );
  }
}
