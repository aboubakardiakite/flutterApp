import 'package:flutter/material.dart';
import 'package:restaurant_app/models/city_model.dart';
import 'package:restaurant_app/views/city/widget/activity_list.dart';
import 'package:restaurant_app/views/city/widget/trip_activity_list.dart';
import 'package:restaurant_app/views/city/widget/trip_overview.dart';
import 'package:restaurant_app/views/home/home_view.dart';

import '../../models/activity_model.dart';

import '../../models/trip_model.dart';
import '../../widgets/data.dart';
import '../../widgets/drawer_widget.dart';


class CityView extends StatefulWidget {
  final CityModel city;
  static const String routeName = '/city';
  final Function? onTripAdded;
  final Function? onTripRemoved;

  CityView({super.key, required this.city, this.onTripAdded, this.onTripRemoved});

  List<Activity> get activities {
    return city.activities;
  }


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


   List<Activity> get tripActivities {
     return widget.activities.where((activity) => myTrip.activities.contains(activity.id)
   ).toList();
}

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print(state);
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
     return myTrip.activities.fold(0.0, (previousValue, element) => previousValue + widget.activities.firstWhere((activity) => activity.id == element).price);
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

   saveTrip()  async{
     final result = await showDialog(context: context, builder: (context){
       return SimpleDialog(
           title: const Text('Voulez-vous sauvegarder ce voyage ?'),
           contentPadding: const EdgeInsets.all(20.0),
           children: [
             Row(
               mainAxisAlignment: MainAxisAlignment.end,
               children: [
                     ElevatedButton(
                         onPressed: () {
                            Navigator.pop(context, 'annuler');
                         },
                         style: ElevatedButton.styleFrom(
                           primary: Colors.grey,
                         ),
                         child: const Text('annuler',style: TextStyle(color: Colors.black),)
                     ),
                      SizedBox.fromSize(size: const Size(10, 0),),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context, 'sauvegarder');
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).primaryColor,
                          ),
                          child: const Text('sauvegarder', style: TextStyle(color: Colors.white)),
                      ),
               ],
             )
           ]
       );
     });
      if(result == 'sauvegarder'){
        widget.onTripAdded!(myTrip);
        Navigator.pushNamed(context, HomeView.routeName, arguments: myTrip);
      }
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Organiser notre voyage'),
      ),
      drawer: DrawerWidget(),
      body: Container(
        //padding: const EdgeInsets.all(10.0),
        child:  widget.showContext(context: context, children: <Widget>[
          TripOverview(myTrip: myTrip, setDate: setDate, amount: amount, cityname: widget.city.name),
          Expanded(
              child: index == 0 ? ActivityList(activities: widget.activities,toggleActivity: toggleActivity, selectedActivities: myTrip.activities) :  TripActivityList(activities: tripActivities,deleteTripActivity: deleteTripActivity)
          ),
        ],)
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){saveTrip();},
        child: const Icon(Icons.forward),
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
