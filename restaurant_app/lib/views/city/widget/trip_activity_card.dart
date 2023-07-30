import 'dart:math';

import 'package:flutter/material.dart';

import '../../../models/activity.model.dart';

class TripActivityCard extends StatefulWidget {
  final Activity activity;
  final  Function deleteTripActivity;

  Color getColor(){
    const colors = [Colors.blue,Colors.red];
    return colors[Random().nextInt(2)];
  }

  const TripActivityCard({super.key, required this.activity, required this.deleteTripActivity});


  @override
  _TripActivityCardState createState() => _TripActivityCardState();
}

class _TripActivityCardState extends State<TripActivityCard> {
  late Color color;

  @override
  void initState() {
    color = widget.getColor();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(widget.activity.image),
        ),
        title: Text(widget.activity.name,style: TextStyle(color: color),),
        trailing:  IconButton(
            icon: Icon(Icons.delete),
            color: Colors.red,
            onPressed: (){
              widget.deleteTripActivity(widget.activity.id);
            }
        ),
      ),
    );;
  }
}
