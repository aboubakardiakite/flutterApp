import 'package:flutter/material.dart';
import 'package:restaurant_app/views/city/widget/activity_card.dart';

import '../../models/activity.model.dart';

import '../../datas/data.dart' as data;


class City extends StatefulWidget {

  final List<Activity> activities = data.activities;

  @override
  _CityState createState() => _CityState();
}

class _CityState extends State<City> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.chevron_left),
        title: const Text('Paris'),
        actions: const [
          Icon(Icons.more_vert)
        ],

      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: widget.activities.map((activity){
             return ActivityCard(activity: activity);
          }).toList(),
        ),
      ),
    );
  }
}
