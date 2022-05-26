import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';

// ignore: must_be_immutable
class SmallText extends StatelessWidget {
  SmallText(
      {Key? key,
      this.color = AppColors.textColor,
      required this.text,
      this.size = 12,
      this.height = 1.2})
      : super(key: key);
  Color? color;
  final String text;
  double size;
  double height;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: size, fontFamily: 'Roboto'),
    );
  }
}
