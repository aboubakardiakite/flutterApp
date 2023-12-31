import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/trip_model.dart';

class TripOverview extends StatelessWidget {

  final Trip myTrip;
  final VoidCallback setDate;
  double amount;
  final String cityname;

  TripOverview({super.key,required this.myTrip, required this.setDate,required this.amount,required this.cityname});


  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    var size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.all(10),
      height: 200,
      width: orientation == Orientation.landscape ? size.width*0.5: double.infinity,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            '$cityname',
            style: const TextStyle(fontSize: 25, decoration: TextDecoration.underline),
          ),
          const SizedBox(height: 30,),
          Row(
            children: [
              Expanded(child: Text(
              (myTrip.dateTime != null ? DateFormat("d/M/y").format(myTrip.dateTime) : 'Choisissez une date'),
                style: const TextStyle(fontSize: 20),
                )
              ),
              ElevatedButton(onPressed: setDate, child: const Text('Selectionner une date'))
            ],
          ),
          const SizedBox(height: 30,),
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Montant / personne',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Text(
                '$amount \$',
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
