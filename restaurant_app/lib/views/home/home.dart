
import 'package:flutter/material.dart';
import 'package:restaurant_app/views/home/widgets/city_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});


  @override
  _HomeState createState() {
    return _HomeState();
  }

}


class _HomeState extends State<Home> {
  List cities = [
    {'name': 'Paris' , 'image':'asserts/images/paris.jpeg' , 'checked': false},
    {'name': 'Lyon' , 'image':'asserts/images/lyon.jpg','checked': false},
    {'name': 'Lille' , 'image':'asserts/images/lille.jpeg','checked':false },
  ];

  void switchChecked(city){
    int index = cities.indexOf(city);
    setState(() {
      cities[index]['checked'] = !cities[index]['checked'];
    });
  }

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
                name: city['name'],
                image: city['image'],
                checked: city['checked'],
                updateChecked: (){
                switchChecked(city);
              },);
            })
          ],
        ),
      ),
    );
  }
}
