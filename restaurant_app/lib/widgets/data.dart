

import 'package:flutter/material.dart';
import '../../datas/data.dart' as data;
import '../models/activity_model.dart';


class Data extends InheritedWidget {

  final List<Activity> activities = data.activitiesParis;


  Data({ required Widget child}): super(child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    //throw UnimplementedError();
    return true;
  }

  static of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<Data>();
  }
}