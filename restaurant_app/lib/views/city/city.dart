import 'package:flutter/material.dart';
import 'package:restaurant_app/views/city/widget/activity_card.dart';
import 'package:restaurant_app/views/city/widget/activity_list.dart';
import 'package:restaurant_app/views/city/widget/trip_activity_list.dart';
import 'package:restaurant_app/views/city/widget/trip_overview.dart';

import '../../models/activity.model.dart';

import '../../datas/data.dart' as data;
import '../../models/trip.model.dart';


class City extends StatefulWidget {

  final List<Activity> activities = data.activities;


  @override
  _CityState createState(){
    return _CityState();
  }
}

class _CityState extends State<City> {

   late Trip myTrip;
    late int index;



  @override
  void initState() {
     print('init state');
    super.initState();
     myTrip = Trip(dateTime: DateTime.now(),city: 'Paris', activities: []);
     index = 0;
  }

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

   double get amount {
     return 0;
   }

   void switchIndex(newIndex){
     setState(() {
       index = newIndex;
     });
   }

   void toggleActivity(String id){
    setState(() {
      myTrip.activities.contains(id) ? myTrip.activities.remove(id) : myTrip.activities.add(id);
      print(myTrip.activities);
    });
   }

  @override
  Widget build(BuildContext context) {
     print('build');
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.chevron_left),
        title: const Text('Organiser notre voyage'),
        actions: const [
          Icon(Icons.more_vert)
        ],
      ),
      body: Container(
        //padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TripOverview(myTrip: myTrip, setDate: setDate, amount: amount),
            Expanded(
                child: index == 0 ? ActivityList(activities: widget.activities,toggleActivity: toggleActivity, selectedActivities: myTrip.activities) :  TripActivityList()
              ),
          ],
        )
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Decouverte'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.stars),
            label: 'Mes activités'
          ),
        ],
        onTap: switchIndex,
      ),
    );
  }
}
