

import 'package:flutter/material.dart';

void main(){
  runApp(DymaTrip());
}

class DymaTrip extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.home),
          title: Text('dymaTrip'),
          actions: <Widget>[Icon(Icons.more_vert)],
        ),
        body: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Card(
                elevation: 5,
                child: Container(
                  height: 150.0,
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Image.asset('asserts/images/paris.jpeg',fit: BoxFit.cover,),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}