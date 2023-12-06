

import 'package:flutter/material.dart';
import 'package:restaurant_app/widgets/drawer_widget.dart';

class TripsView extends StatefulWidget {
  const TripsView({super.key});
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
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text('Trips'),
          ],
        ),
      ),
    );

  }
}
