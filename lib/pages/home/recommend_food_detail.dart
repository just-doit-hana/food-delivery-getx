import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimemsion.dart';
import 'package:food_delivery/widget/app_icon.dart';
import 'package:food_delivery/widget/big_text.dart';
import 'package:food_delivery/widget/exandable_text_widget.dart';

class RecommendFoodDetail extends StatelessWidget {
  const RecommendFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 80,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_bag)
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                // margin: EdgeInsets.only(
                // left: DimemsionApp.width20, right: DimemsionApp.width20),
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5, bottom: 10),

                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(DimemsionApp.radius20),
                        topLeft: Radius.circular(DimemsionApp.radius20))),
                child: Center(
                    child: BigText(
                        size: DimemsionApp.font26, text: 'Sliver app bar')),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/image/food_1.jpeg',
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: DimemsionApp.width20),
                child: const ExandableTextWidget(
                    text:
                        ' QUanghu According to diplomats, Heyzer, who was appointed in October 2021,  According to diplomats, Heyzer, who was appointed in October 2021, has been given a general green light to make her first trip to Myanmar, but has not yet received the necessary authorisations for her stay and the people she may meet.According to diplomats, Heyzer, who was appointed in October 2021, has been given a general green light to make her first trip to Myanmar, but has not yet received the necessary authorisations for her stay and the people she may meet. According to diplomats, Heyzer, who was appointed in October 2021, has been given a general green light to make her first trip to Myanmar, but has not yet received the necessary authorisations for her stay and the people she may meet.'),
              )
            ],
          )),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
                top: DimemsionApp.height10,
                bottom: DimemsionApp.height10,
                left: DimemsionApp.width20 * 2.5,
                right: DimemsionApp.width20 * 2.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  iconSize: DimemsionApp.iconSize24,
                  iColor: Colors.white,
                  icon: Icons.remove,
                  bgColor: AppColors.mainColor,
                ),
                // ignore: prefer_adjacent_string_concatenation, prefer_interpolation_to_compose_strings
                BigText(
                  text: "\$12.88" + " X " + " 0 ",
                  color: AppColors.mainBlackColor,
                  size: DimemsionApp.font26,
                ),
                AppIcon(
                  iconSize: DimemsionApp.iconSize24,
                  iColor: Colors.white,
                  icon: Icons.add,
                  bgColor: AppColors.mainColor,
                )
              ],
            ),
          ),
          Container(
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
                        borderRadius:
                            BorderRadius.circular(DimemsionApp.radius20),
                        color: Colors.white),
                    child: Icon(
                      Icons.favorite,
                      color: AppColors.mainColor,
                      size: 30,
                    )),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: DimemsionApp.width20,
                      horizontal: DimemsionApp.height10),
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(DimemsionApp.radius20),
                      color: AppColors.mainColor),
                  child: BigText(
                    text: '\$10 | Add to cart',
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
