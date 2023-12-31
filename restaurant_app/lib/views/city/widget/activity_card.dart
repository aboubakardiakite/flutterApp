import 'package:flutter/material.dart';
import 'package:restaurant_app/models/activity_model.dart';

class ActivityCard extends StatelessWidget {

  final Activity activity;
  final bool isSelected;
  final VoidCallback toggleActivity;

  ActivityCard({super.key, required this.activity,required this.isSelected,required this.toggleActivity});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(1),
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Ink.image(
            image: AssetImage(activity.image),
            fit: BoxFit.cover,
            child: InkWell(onTap: toggleActivity,),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if(isSelected) Icon(Icons.check,size: 40,color: Colors.white,),
                        ],
                      )
                ),
                Row(
                  children: <Widget>[
                    Flexible(child: FittedBox(child: Text(activity.name,style: TextStyle(fontSize: 20,color: Colors.white),),)),

                  ],
                )
              ],
            ),
          )
        ],
      )


    );
  }
}
