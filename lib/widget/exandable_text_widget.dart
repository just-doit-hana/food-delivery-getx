import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimemsion.dart';
import 'package:food_delivery/widget/small_text.dart';

class ExandableTextWidget extends StatefulWidget {
  const ExandableTextWidget({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  State<ExandableTextWidget> createState() => _ExandableTextWidgetState();
}

class _ExandableTextWidgetState extends State<ExandableTextWidget> {
  late String fistHaft;
  late String secondHaft;
  bool hiddenText = true;
  double textHeight = DimemsionApp.screenHeight / 6.17;
  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      fistHaft = widget.text.substring(0, textHeight.toInt());
      secondHaft =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      fistHaft = widget.text;
      secondHaft = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHaft.isEmpty
          ? SmallText(
              color: AppColors.paramColor,
              size: DimemsionApp.font16,
              text: fistHaft)
          : Column(
              children: [
                SmallText(
                    height: 1.8,
                    color: AppColors.paramColor,
                    size: DimemsionApp.font16,
                    text: hiddenText
                        ? ("$fistHaft...")
                        : (fistHaft + secondHaft)),
                InkWell(
                  onTap: () {
                    // print(hiddenText);
                    hiddenText = !hiddenText;
                  },
                  child: Row(
                    children: [
                      SmallText(
                        text: 'Show more',
                        color: AppColors.mainColor,
                      ),
                      Icon(
                          hiddenText
                              ? Icons.arrow_drop_down
                              : Icons.arrow_drop_up,
                          color: AppColors.mainColor)
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
