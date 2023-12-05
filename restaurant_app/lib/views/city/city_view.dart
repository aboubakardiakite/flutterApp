import 'package:flutter/material.dart';
import 'package:restaurant_app/models/city_model.dart';
import 'package:restaurant_app/views/city/widget/activity_list.dart';
import 'package:restaurant_app/views/city/widget/trip_activity_list.dart';
import 'package:restaurant_app/views/city/widget/trip_overview.dart';

import '../../models/activity_model.dart';

import '../../models/trip_model.dart';
import '../../widgets/data.dart';


class CityView extends StatefulWidget {
  final CityModel city;
  static const routeName = '/city';
  const CityView({super.key, required this.city});



  showContext({required BuildContext context, required List<Widget> children}){
    var orientation = MediaQuery.of(context).orientation;
    if(orientation == Orientation.portrait) {
      return Column(
        children: children,
      );
    }else{
      return Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,

      );
    }
  }
  @override
  _CityViewState createState(){
    return _CityViewState();
  }
}

class _CityViewState extends State<CityView> with WidgetsBindingObserver {

   late Trip myTrip;
   late int index;
   late List<Activity> activities;


   List<Activity> get tripActivities {
     return activities.where((activity) => myTrip.activities.contains(activity.id)
   ).toList();
}

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print(state);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    activities = Data.of(context).activities;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
     myTrip = Trip(dateTime: DateTime.now(),city: 'Paris', activities: []);
     index = 0;
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
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
    });
   }
   void deleteTripActivity(String id){
     setState(() {
       myTrip.activities.remove(id);
     });
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.chevron_left)
        ),
        title: const Text('Organiser notre voyage'),
        actions: const [
          Icon(Icons.more_vert)
        ],
      ),
      body: Container(
        //padding: const EdgeInsets.all(10.0),
        child:  widget.showContext(context: context, children: <Widget>[
          TripOverview(myTrip: myTrip, setDate: setDate, amount: amount, cityname: widget.city.name),
          Expanded(
              child: index == 0 ? ActivityList(activities: activities,toggleActivity: toggleActivity, selectedActivities: myTrip.activities) :  TripActivityList(activities: tripActivities,deleteTripActivity: deleteTripActivity)
          ),
        ],)
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
