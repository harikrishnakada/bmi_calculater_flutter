import 'package:flutter/material.dart';

import 'contants/global_constants.dart';

class CardContent extends StatelessWidget {
  CardContent({required this.label, required this.iconData});

  final String label;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          size: 80.0,
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          label,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
