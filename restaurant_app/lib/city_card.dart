import 'package:flutter/material.dart';

class CityCard extends StatelessWidget {
  final String name;
  final String image;
  final bool? checked;
  final VoidCallback updateChecked;

  CityCard({required this.name, required this.image, this.checked,required this.updateChecked});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: SizedBox(
        height: 150.0,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Ink.image(
              fit: BoxFit.cover,
              image: AssetImage(image),
              child: InkWell(
                onTap: (){
                  updateChecked();
                },
              ),
            ),
             Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                   Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: <Widget>[
                        Icon(
                          (checked == true ? Icons.star : Icons.star_border),
                          size: 40,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
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
