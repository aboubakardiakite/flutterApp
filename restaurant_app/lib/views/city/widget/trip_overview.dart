import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/trip.model.dart';

class TripOverview extends StatelessWidget {

  final Trip myTrip;
  final VoidCallback setDate;
  double amount;

  TripOverview({super.key,required this.myTrip, required this.setDate,required this.amount});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 200,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Paris',
            style: TextStyle(fontSize: 25, decoration: TextDecoration.underline),
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
