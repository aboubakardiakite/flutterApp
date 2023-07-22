import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:restaurant_app/views/city/widget/activity_card.dart';

import '../../models/activity.model.dart';

import '../../datas/data.dart' as data;
import '../../models/trip.model.dart';


class City extends StatefulWidget {

  final List<Activity> activities = data.activities;

  @override
  _CityState createState() => _CityState();
}

class _CityState extends State<City> {

   Trip myTrip = Trip(dateTime: DateTime.now(),city: 'Paris', activities: []);

   void setDate(){
      showDatePicker(context: context, initialDate: DateTime.now().add(const Duration(days: 1)) , firstDate: DateTime.now(), lastDate: DateTime(2024))
          .then((newDate){
            if(newDate != null){
              setState(() {
                myTrip.dateTime = newDate;
              });
            }
      });
   }

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
        //padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              height: 200,
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(child: Text(DateFormat("d/M/y").format(myTrip.dateTime))),
                      ElevatedButton(onPressed: setDate, child: Text('Selectionner une date'))
                    ],
                  )
                ],
              ),
            ),
            Expanded(child: GridView.count(
                crossAxisCount: 2,
                children: widget.activities.map((activity) => ActivityCard(activity: activity)
                ).toList()
            ),)
          ],
        )
      ),
    );
  }
}
