
import 'package:flutter/material.dart';
import 'package:restaurant_app/models/city_model.dart';
import 'package:restaurant_app/views/home/widgets/city_card.dart';
import 'package:restaurant_app/widgets/modal.dart';

import '../../widgets/drawer_widget.dart';

class HomeView extends StatefulWidget {
  final List<CityModel> cities;
  const HomeView({super.key, required this.cities});

  static const String routeName = '/';


  @override
  _HomeViewState createState() {
    return _HomeViewState();
  }

}


class _HomeViewState extends State<HomeView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Trips'),
      ),
      drawer: DrawerWidget(),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ...widget.cities.map((city){
              return CityCard(
                city: city
              );
            }),
            ElevatedButton(onPressed: (){
              openModal(context);
            }, child: Text('Modal')),
          ],
        ),
      ),
    );
  }

  openModal(context) {
    askModal(context, "Voulez-vous continuer ?").then((value) => print(value));
  }


}
