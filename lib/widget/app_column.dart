import 'package:flutter/material.dart';
import 'package:food_delivery/widget/big_text.dart';

import '../utils/Dimemsion.dart';
import '../utils/colors.dart';
import 'icon_and_text_widget.dart';
import 'small_text.dart';

class AppColumn extends StatelessWidget {
  AppColumn({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      BigText(
        text: text,
        size: DimemsionApp.font26,
      ),
      SizedBox(
        height: DimemsionApp.height10,
      ),
      Row(
        children: [
          Wrap(
            children: List.generate(
                5,
                (index) => const Icon(
                      Icons.star,
                      color: AppColors.mainColor,
                      size: 15,
                    )),
          ),
          const SizedBox(
            width: 10,
          ),
          SmallText(text: '4.5'),
          const SizedBox(
            width: 10,
          ),
          SmallText(text: '200 comments')
        ],
      ),
      SizedBox(
        height: DimemsionApp.height20,
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          IconAndTextWidget(
            icon: Icons.circle_sharp,
            text: 'Normal',
            iColor: AppColors.iconColor1,
            // color: AppColors.textColor
          ),
          IconAndTextWidget(
            icon: Icons.location_on,
            text: '1.7km',
            iColor: AppColors.mainColor,
            // color: AppColors.textColor
          ),
          IconAndTextWidget(
            icon: Icons.access_time_rounded,
            text: '32 min',
            iColor: AppColors.iconColor2,
            // color: AppColors.textColor
          )
        ],
      )
    ]);
  }
}
