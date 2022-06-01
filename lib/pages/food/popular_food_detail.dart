// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:food_delivery/controller/cart_controller.dart';
import 'package:food_delivery/controller/popular_product_controller.dart';
import 'package:food_delivery/pages/cart/cart_pages.dart';
import 'package:food_delivery/pages/home/main_food_pages.dart';
import 'package:food_delivery/utils/app_constant.dart';
import 'package:food_delivery/utils/dimemsion.dart';
import 'package:food_delivery/widget/app_column.dart';
import 'package:food_delivery/widget/app_icon.dart';
import 'package:food_delivery/widget/exandable_text_widget.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';
import '../../widget/big_text.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key, required this.pageId}) : super(key: key);
  final int pageId;

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());
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
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "${AppConstant.BASE_URL}${AppConstant.UPLOAD_URL}/" +
                                  product.img!))),
                )),
            Positioned(
                top: DimemsionApp.height45,
                left: DimemsionApp.width20,
                right: DimemsionApp.width20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Get.to(() => const MainFoodPages()),
                      child: AppIcon(icon: Icons.arrow_back_ios),
                    ),
                    GetBuilder<PopularProductController>(builder: (controller) {
                      return Stack(
                        children: [
                          GestureDetector(
                              onTap: () {
                                Get.to(() => CartPages());
                              },
                              child:
                                  AppIcon(icon: Icons.shopping_bag_outlined)),
                          Get.find<PopularProductController>().totalItems >= 1
                              ? Positioned(
                                  top: 0,
                                  right: 0,
                                  child: AppIcon(
                                    size: 20,
                                    icon: Icons.circle,
                                    iColor: Colors.transparent,
                                    bgColor: AppColors.mainColor,
                                  ))
                              : Container(),
                          Get.find<PopularProductController>().totalItems >= 1
                              ? Positioned(
                                  top: 3,
                                  right: 6,
                                  child: BigText(
                                      color: Colors.white,
                                      size: 12,
                                      text: Get.find<PopularProductController>()
                                          .totalItems
                                          .toString()),
                                )
                              : Container(),
                        ],
                      );
                    }),
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
                          text: product.name!,
                        ),
                        SizedBox(
                          height: DimemsionApp.height20,
                        ),
                        BigText(text: 'Introduce'),
                        SizedBox(
                          height: DimemsionApp.height20,
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: ExandableTextWidget(
                              text: product.description!,
                            ),
                          ),
                        )
                      ],
                    ))),
          ],
        ),
        bottomNavigationBar:
            GetBuilder<PopularProductController>(builder: (popularProduct) {
          return Container(
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
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          popularProduct.setQuantity(false);
                        },
                        child: const Icon(
                          Icons.remove,
                          color: AppColors.signColor,
                        ),
                      ),
                      SizedBox(
                        width: DimemsionApp.width10 / 2,
                      ),
                      BigText(text: popularProduct.incartItem.toString()),
                      SizedBox(
                        width: DimemsionApp.width10 / 2,
                      ),
                      GestureDetector(
                        onTap: () {
                          popularProduct.setQuantity(true);
                        },
                        child: const Icon(
                          Icons.add,
                          color: AppColors.signColor,
                        ),
                      ),
                      SizedBox(
                        width: DimemsionApp.width10 / 2,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    popularProduct.addItem(product);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: DimemsionApp.width20,
                        horizontal: DimemsionApp.height10),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(DimemsionApp.radius20),
                        color: AppColors.mainColor),
                    child: BigText(
                      text: '\$ ${product.price!} | Add to cart',
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          );
        }));
  }
}
