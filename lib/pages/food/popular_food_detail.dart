import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimemsion.dart';
import 'package:food_delivery/widget/app_column.dart';
import 'package:food_delivery/widget/app_icon.dart';
import 'package:food_delivery/widget/exandable_text_widget.dart';

import '../../utils/colors.dart';
import '../../widget/big_text.dart';
import '../../widget/icon_and_text_widget.dart';
import '../../widget/small_text.dart';

class PopularFoodDetail extends StatefulWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PopularFoodDetailState createState() => _PopularFoodDetailState();
}

class _PopularFoodDetailState extends State<PopularFoodDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.infinity,
                height: DimemsionApp.popularFoodImg,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/image/food_2.jpeg"))),
              )),
          Positioned(
              top: DimemsionApp.height45,
              left: DimemsionApp.width20,
              right: DimemsionApp.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(icon: Icons.arrow_back_ios),
                  AppIcon(icon: Icons.shopping_bag_outlined)
                ],
              )),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: DimemsionApp.popularFoodImg - 20,
              child: Container(
                  padding: EdgeInsets.only(
                      top: DimemsionApp.height20,
                      left: DimemsionApp.width20,
                      right: DimemsionApp.width20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(DimemsionApp.radius20),
                        topRight: Radius.circular(DimemsionApp.radius20)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AppColumn(
                        text: 'VIet Name Local food',
                      ),
                      SizedBox(
                        height: DimemsionApp.height20,
                      ),
                      BigText(text: 'Introduce'),
                      SizedBox(
                        height: DimemsionApp.height20,
                      ),
                      const Expanded(
                        child: SingleChildScrollView(
                          child: ExandableTextWidget(
                              text:
                                  ' QUanghu According to diplomats, Heyzer, who was appointed in October 2021,  According to diplomats, Heyzer, who was appointed in October 2021, has been given a general green light to make her first trip to Myanmar, but has not yet received the necessary authorisations for her stay and the people she may meet.According to diplomats, Heyzer, who was appointed in October 2021, has been given a general green light to make her first trip to Myanmar, but has not yet received the necessary authorisations for her stay and the people she may meet. According to diplomats, Heyzer, who was appointed in October 2021, has been given a general green light to make her first trip to Myanmar, but has not yet received the necessary authorisations for her stay and the people she may meet.'),
                        ),
                      )
                    ],
                  ))),
        ],
      ),
      bottomNavigationBar: Container(
        height: DimemsionApp.bottomHeight,
        padding: EdgeInsets.only(
            top: DimemsionApp.height30,
            bottom: DimemsionApp.height30,
            right: DimemsionApp.width20,
            left: DimemsionApp.width20),
        decoration: BoxDecoration(
            color: AppColors.btnBgColor,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(DimemsionApp.radius20 * 2),
                topLeft: Radius.circular(DimemsionApp.radius20 * 2))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: DimemsionApp.width20,
                  horizontal: DimemsionApp.height10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(DimemsionApp.radius20),
                  color: Colors.white),
              child: Row(
                children: [
                  const Icon(
                    Icons.remove,
                    color: AppColors.signColor,
                  ),
                  SizedBox(
                    width: DimemsionApp.width10 / 2,
                  ),
                  BigText(text: '0'),
                  SizedBox(
                    width: DimemsionApp.width10 / 2,
                  ),
                  const Icon(
                    Icons.add,
                    color: AppColors.signColor,
                  ),
                  SizedBox(
                    width: DimemsionApp.width10 / 2,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: DimemsionApp.width20,
                  horizontal: DimemsionApp.height10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(DimemsionApp.radius20),
                  color: AppColors.mainColor),
              child: BigText(
                text: '\$10 | Add to cart',
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
