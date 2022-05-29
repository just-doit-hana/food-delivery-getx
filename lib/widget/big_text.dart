import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimemsion.dart';
import 'package:food_delivery/utils/colors.dart';

// ignore: must_be_immutable
class BigText extends StatelessWidget {
  BigText(
      {Key? key,
      this.color = AppColors.mainBlackColor,
      required this.text,
      this.overflow = TextOverflow.ellipsis,
      this.size = 0})
      : super(key: key);
  Color? color;
  final String text;
  double size;
  TextOverflow overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      style: TextStyle(
          overflow: overflow,
          color: color,
          fontSize: size == 0 ? DimemsionApp.font20 : size,
          fontWeight: FontWeight.w400,
          fontFamily: 'Roboto'),
    );
  }
}
