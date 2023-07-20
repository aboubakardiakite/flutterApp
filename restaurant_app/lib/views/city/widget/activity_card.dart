import 'package:flutter/material.dart';
import 'package:restaurant_app/models/activity.model.dart';

class ActivityCard extends StatelessWidget {

  final Activity activity;

  ActivityCard({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(1),
      child: Image.asset(activity.image,fit: BoxFit.cover,),
    );
  }
}
