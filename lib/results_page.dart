import 'package:bmo_calculater_flutter/card_container.dart';
import 'package:flutter/material.dart';

import 'contants/global_constants.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Your Result',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            Expanded(
              child: CardContainer(
                onTapped: () {},
                margin: EdgeInsets.all(20),
                cardColor: kActiveCardColorHex,
                cardChild: Column(
                  children: [
                    Expanded(
                        child: Text(
                      args['status'],
                      style: TextStyle(fontSize: 20),
                    )),
                    Expanded(
                        child: Text(
                      args['result'].toStringAsFixed(2),
                      style: TextStyle(fontSize: 30),
                    )),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
