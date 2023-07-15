import 'package:flutter/material.dart';

class CityCard extends StatelessWidget {
  const CityCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        height: 150.0,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Ink.image(
              fit: BoxFit.cover,
              image: AssetImage('asserts/images/paris.jpeg'),
              child: InkWell(
                onTap: (){
                  print("tap2");
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.star_border,
                          size: 40,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text('Paris', style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
