import 'package:flutter/material.dart';
import 'package:food_delivery/widget/big_text.dart';

class UnknownRoutePage extends StatelessWidget {
  const UnknownRoutePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BigText(
        text: 'Not Found Error',
        color: Colors.redAccent,
        size: 30,
      ),
    );
  }
}
