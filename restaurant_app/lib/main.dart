

import 'package:flutter/material.dart';
import 'package:restaurant_app/home.dart';

void main(){
  runApp(DymaTrip());
}

class DymaTrip extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }

}