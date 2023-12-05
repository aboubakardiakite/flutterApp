

import 'package:flutter/material.dart';
import 'package:restaurant_app/views/city/city_view.dart';
import 'package:restaurant_app/views/home/home.dart';
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
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
        ),
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.green),
        ),
      ),
      debugShowCheckedModeBanner: false,
      // home: HomeView(),
      home: Data(child:CityView() ,) ,
    );
  }

}