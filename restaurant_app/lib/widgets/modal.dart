

import 'package:flutter/material.dart';

Future<String> askModal(BuildContext context, String question) async {
  final result = await Navigator.push(context, PageRouteBuilder(pageBuilder: (context,_,__){
    return AskModal(question: question);
  }, opaque: false));

  return result;
}


class AskModal extends StatelessWidget {
  const AskModal({Key? key, required this.question}) : super(key: key);
  final String question;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.5),
      alignment: Alignment.center,
      child: Card(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(question),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, "ok");
                    },
                    child: Text("ok"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, "annuler");
                    },
                    child: Text("annuler"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}