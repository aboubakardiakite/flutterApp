
import 'package:flutter/material.dart';
import 'package:restaurant_app/models/city_model.dart';
import 'package:restaurant_app/views/home/widgets/city_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});


  @override
  _HomeViewState createState() {
    return _HomeViewState();
  }

}


class _HomeViewState extends State<HomeView> {
  List cities = [
    CityModel(image: 'asserts/images/paris.jpeg', name: 'Paris' ),
    CityModel(image: 'asserts/images/lyon.jpg', name: 'Lyon' ),
    CityModel(image: 'asserts/images/lille.jpeg', name: 'Lille' ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.home),
        title: const Text('dymaTrip'),
        actions: const <Widget>[Icon(Icons.more_vert)],
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ...cities.map((city){
              return CityCard(
                city: city
              );
            })
          ],
        ),
      ),
    );
  }
}
