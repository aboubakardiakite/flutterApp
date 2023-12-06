import 'package:flutter/material.dart';
import 'package:restaurant_app/models/city_model.dart';
import 'package:restaurant_app/views/city/city_view.dart';
import 'package:restaurant_app/views/error/not_found.dart';
import 'package:restaurant_app/views/home/home_view.dart';
import 'package:restaurant_app/views/trips/trips_view.dart';
import 'package:restaurant_app/widgets/data.dart';
import '../../../datas/data.dart' as data;
import 'models/trip_model.dart';

void main() {
  runApp(MyTrip());
}

class MyTrip extends StatefulWidget {

  MyTrip({super.key});

  final List<CityModel> cities = data.cities;

  @override
  _MyTripState createState() => _MyTripState();
}


class _MyTripState extends State<MyTrip> {
  List<Trip> trips = [];

  void addTrip(Trip trip) {
    setState(() {
      trips.add(trip);
    });
  }

  void removeTrip(Trip trip) {
    setState(() {
      trips.remove(trip);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        HomeView.routeName: (context) => HomeView(cities: widget.cities,),
      },
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case CityView.routeName:
            final CityModel city = settings.arguments as CityModel;
            return MaterialPageRoute(
                builder: (context) => CityView(city: city,onTripAdded: addTrip,onTripRemoved: removeTrip));
          case TripsView.routeName:
            return MaterialPageRoute(builder: (context) => const TripsView());
          default:
            return MaterialPageRoute(builder: (context) => NotFound());
        }
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => NotFound());
      },
      // home: Data(child:CityView() ,) ,
    );
  }
}
