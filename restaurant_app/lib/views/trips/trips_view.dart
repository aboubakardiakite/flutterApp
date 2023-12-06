

import 'package:flutter/material.dart';
import 'package:restaurant_app/views/trips/widgets/trip_list.dart';
import 'package:restaurant_app/widgets/drawer_widget.dart';

import '../../models/trip_model.dart';

class TripsView extends StatefulWidget {
  final List<Trip> trips;
  const TripsView({super.key, required this.trips});
  static const String routeName = '/trips';

  @override
  State<TripsView> createState() => _TripsViewState();
}

class _TripsViewState extends State<TripsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mes voyages'),
      ),
      drawer: DrawerWidget(),
      body: TripList(trips: widget.trips),
    );

  }
}
