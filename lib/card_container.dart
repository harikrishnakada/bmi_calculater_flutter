import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  CardContainer(
      {required this.cardColor,
      this.cardChild,
      required this.onTapped,
      this.margin});
  final Color cardColor;
  final Widget? cardChild;
  final void Function() onTapped;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped,
      child: Container(
        child: cardChild,
        margin: margin ?? EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: cardColor, borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
