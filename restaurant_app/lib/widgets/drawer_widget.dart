

import 'package:flutter/material.dart';
import 'package:restaurant_app/views/trips/trips_view.dart';

import '../views/home/home_view.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children:  <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Theme.of(context).primaryColor,
                  Theme.of(context).primaryColor.withOpacity(0.5),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: const Text(
              'My Trips',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Accueil'),
            onTap: (){
              Navigator.pushNamed(context, HomeView.routeName);
            },
          ),
          Divider(),
           ListTile(
            leading: Icon(Icons.flight),
            title: Text('Mes voyages'),
            onTap: (){
              Navigator.pushNamed(context, TripsView.routeName);
            }
          ),
          Divider(),
          const ListTile(
            leading: Icon(Icons.logout),
            title: Text('Déconnexion'),
          ),
        ],
      ),
    );
  }
}