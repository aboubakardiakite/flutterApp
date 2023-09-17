

import 'package:flutter/material.dart';
import 'package:restaurant_app/views/city/city.dart';
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
      debugShowCheckedModeBanner: false,
      home: Data(child:City() ,) ,
    );
  }

}