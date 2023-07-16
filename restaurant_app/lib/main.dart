

import 'package:flutter/material.dart';
import 'package:restaurant_app/home.dart';

void main(){
  runApp(DymaTrip());
}

class DymaTrip extends StatelessWidget{
  const DymaTrip({super.key});


  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }

}