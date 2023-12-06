

import 'package:flutter/material.dart';
import 'package:restaurant_app/models/city_model.dart';
import 'package:restaurant_app/views/city/city_view.dart';
import 'package:restaurant_app/views/error/not_found.dart';
import 'package:restaurant_app/views/home/home_view.dart';
import 'package:restaurant_app/widgets/data.dart';

void main(){
  runApp(DymaTrip());
}

class DymaTrip extends StatelessWidget{
  const DymaTrip({super.key});


  @override
  Widget build(BuildContext context){
    return  MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 20),
        ),
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.black,fontSize: 20),
        ),
      ),
      debugShowCheckedModeBanner: false,
      // initialRoute: '/city',
      routes: {
        HomeView.routeName: (context) => const HomeView(),
      },
      onGenerateRoute: (settings){
        if(settings.name == CityView.routeName){
          final CityModel city = settings.arguments as CityModel;
          return MaterialPageRoute(builder: (context) => Data(child: CityView(city: city) ,));
        }
      },
      onUnknownRoute: (settings){
        return MaterialPageRoute(builder: (context) => NotFound());
      },
      // home: Data(child:CityView() ,) ,
    );
  }

}