import 'package:flutter/material.dart';
import 'package:food_delivery/controller/popular_product_controller.dart';
import 'package:food_delivery/controller/recomemded_product_controller.dart';
import 'package:food_delivery/pages/cart/cart_pages.dart';
import 'package:food_delivery/router/router_help.dart';
import 'package:food_delivery/utils/app_constant.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimemsion.dart';
import 'package:food_delivery/widget/app_icon.dart';
import 'package:food_delivery/widget/big_text.dart';
import 'package:food_delivery/widget/exandable_text_widget.dart';

import 'package:get/get.dart';

import '../../controller/cart_controller.dart';

class RecommendFoodDetail extends StatelessWidget {
  const RecommendFoodDetail({Key? key, required this.pageId}) : super(key: key);
  final int pageId;
  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<RecomemdedProductController>().recommemedProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());
    return Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: 80,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Get.toNamed(RouterHelper.initial),
                    child: AppIcon(icon: Icons.clear),
                  ),
                  // AppIcon(icon: Icons.shopping_bag)
                  GetBuilder<PopularProductController>(builder: (controller) {
                    return Stack(
                      children: [
                        GestureDetector(
                            onTap: () {
                              Get.to(() => const CartPages());
                            },
                            child: AppIcon(icon: Icons.shopping_bag_outlined)),
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
                          size: DimemsionApp.font26, text: product.name!)),
                ),
              ),
              pinned: true,
              backgroundColor: AppColors.yellowColor,
              expandedHeight: 300,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  // ignore: prefer_interpolation_to_compose_strings
                  "${AppConstant.BASE_URL}${AppConstant.UPLOAD_URL}/" +
                      product.img!,
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverToBoxAdapter(
                child: Column(
              children: [
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: DimemsionApp.width20),
                  child: ExandableTextWidget(text: product.description!),
                )
              ],
            )),
          ],
        ),
        bottomNavigationBar:
            GetBuilder<PopularProductController>(builder: (controller) {
          return Column(
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
                    GestureDetector(
                      onTap: () {
                        controller.setQuantity(false);
                      },
                      child: AppIcon(
                        iconSize: DimemsionApp.iconSize24,
                        iColor: Colors.white,
                        icon: Icons.remove,
                        bgColor: AppColors.mainColor,
                      ),
                    ),
                    // ignore: prefer_adjacent_string_concatenation, prefer_interpolation_to_compose_strings
                    BigText(
                      text: "\$${product.price!} X  ${controller.incartItem} ",
                      color: AppColors.mainBlackColor,
                      size: DimemsionApp.font26,
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.setQuantity(true);
                      },
                      child: AppIcon(
                        iconSize: DimemsionApp.iconSize24,
                        iColor: Colors.white,
                        icon: Icons.add,
                        bgColor: AppColors.mainColor,
                      ),
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
                    GestureDetector(
                      onTap: () {
                        controller.addItem(product);
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
                          text: '\$${product.price!} | Add to cart',
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        }));
  }
}
