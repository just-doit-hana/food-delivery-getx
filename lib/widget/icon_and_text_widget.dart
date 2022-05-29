import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimemsion.dart';
import 'package:food_delivery/widget/small_text.dart';

class IconAndTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iColor;
  // final Color color;

  const IconAndTextWidget({
    Key? key,
    required this.icon,
    required this.text,
    required this.iColor,
    // required this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iColor,
          size: DimemsionApp.iconSize24,
        ),
        const SizedBox(
          width: 5,
        ),
        SmallText(
          text: text,
          // color: color,
        ),
      ],
    );
  }
}
