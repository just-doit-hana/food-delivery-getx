import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimemsion.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/widget/big_text.dart';
import 'package:food_delivery/widget/small_text.dart';

import 'food_page_body.dart';

class MainFoodPages extends StatefulWidget {
  const MainFoodPages({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MainFoodPagesState createState() => _MainFoodPagesState();
}

class _MainFoodPagesState extends State<MainFoodPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              margin: EdgeInsets.only(
                  top: DimemsionApp.height45, bottom: DimemsionApp.height15),
              padding: EdgeInsets.only(
                  left: DimemsionApp.width20, right: DimemsionApp.width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(
                        text: 'Viet Nam',
                        color: AppColors.mainColor,
                      ),
                      Row(
                        children: [
                          SmallText(
                            text: 'Ho Chi Minh',
                            color: Colors.black38,
                          ),
                          const Icon(Icons.arrow_drop_down_rounded)
                        ],
                      )
                    ],
                  ),
                  Center(
                    child: Container(
                      width: DimemsionApp.height45,
                      height: DimemsionApp.height45,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(DimemsionApp.radius15),
                          color: AppColors.mainColor),
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: DimemsionApp.iconSize24,
                      ),
                    ),
                  )
                ],
              )),
          const Expanded(
              child: SingleChildScrollView(
            child: FoodPageBody(),
          ))
        ],
      ),
    );
  }
}
