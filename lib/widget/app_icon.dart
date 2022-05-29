import 'package:flutter/material.dart';
import 'package:food_delivery/utils/Dimemsion.dart';

class AppIcon extends StatelessWidget {
  AppIcon(
      {Key? key,
      required this.icon,
      this.bgColor = const Color(0xFFfcf4e4),
      this.iColor = const Color(0xFF756d54),
      this.size = 40,
      this.iconSize = 16})
      : super(key: key);

  final IconData icon;
  final Color bgColor;
  final Color iColor;
  double iconSize;
  double size;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size / 2), color: bgColor),
      child: Icon(
        icon,
        color: iColor,
        size: iconSize,
      ),
    );
  }
}
