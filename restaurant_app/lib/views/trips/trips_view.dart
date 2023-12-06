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
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Mes voyages'),
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: 'A venir',
                ),
                Tab(
                  text: 'Passés',
                ),
              ],
            ),
          ),
          drawer: DrawerWidget(),
          body: TabBarView(
            children: [
              TripList(
                trips: widget.trips.where((trip) => DateTime.now().isBefore(trip.dateTime)).toList(),
              ),TripList(
                trips: widget.trips.where((trip) => DateTime.now().isAfter(trip.dateTime)).toList(),
              ),
            ],
          )
        ));
  }
}
