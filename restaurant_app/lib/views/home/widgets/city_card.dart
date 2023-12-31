import 'package:flutter/material.dart';
import 'package:restaurant_app/models/city_model.dart';

import '../../city/city_view.dart';


class CityCard extends StatelessWidget {
  final CityModel city;
  const CityCard({required this.city});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: SizedBox(
        height: 150.0,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Ink.image(
              fit: BoxFit.cover,
              image: AssetImage(city.image),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    CityView.routeName,
                    arguments: city,
                  );
                },
              ),
            ),
            Positioned(
                top: 10,
                left: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                  color: Colors.black54,
                  child:  Text(
                    city.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: Colors.white,
                    ),
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}
