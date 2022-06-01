import 'package:flutter/material.dart';
import 'package:food_delivery/controller/cart_controller.dart';
import 'package:food_delivery/router/router_help.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimemsion.dart';
import 'package:food_delivery/widget/app_icon.dart';
import 'package:food_delivery/widget/big_text.dart';
import 'package:food_delivery/widget/small_text.dart';
import 'package:get/get.dart';

import '../../utils/app_constant.dart';

class CartPages extends StatelessWidget {
  const CartPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: DimemsionApp.height20 * 3,
              left: DimemsionApp.width20,
              right: DimemsionApp.width20,
              // bottom: DimemsionApp.height30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(
                    icon: Icons.arrow_back_ios,
                    iColor: Colors.white,
                    bgColor: AppColors.mainColor,
                    iconSize: DimemsionApp.iconSize24,
                  ),
                  SizedBox(width: DimemsionApp.width20 * 5),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouterHelper.initial);
                    },
                    child: AppIcon(
                      icon: Icons.home_outlined,
                      iColor: Colors.white,
                      iconSize: DimemsionApp.iconSize24,
                      bgColor: AppColors.mainColor,
                    ),
                  ),
                  AppIcon(
                    icon: Icons.shopping_bag,
                    iColor: Colors.white,
                    iconSize: DimemsionApp.iconSize24,
                    bgColor: AppColors.mainColor,
                  )
                ],
              )),
          Positioned(
              top: DimemsionApp.height20 * 5,
              left: DimemsionApp.width20,
              right: DimemsionApp.width20,
              bottom: 0,
              child: Container(
                  margin: EdgeInsets.only(top: DimemsionApp.height15),
                  child: GetBuilder<CartController>(builder: (cart) {
                    return MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: ListView.builder(
                          itemCount: cart.getItems.length,
                          itemBuilder: (_, index) {
                            return Container(
                              height: DimemsionApp.height20 * 5,
                              width: double.maxFinite,
                              child: Row(
                                children: [
                                  Container(
                                    width: DimemsionApp.height20 * 5,
                                    height: DimemsionApp.height20 * 5,
                                    margin: EdgeInsets.only(
                                        bottom: DimemsionApp.height10),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                "${AppConstant.BASE_URL}${AppConstant.UPLOAD_URL}/" +
                                                    cart.getItems[index].img!)),
                                        color: Colors.orangeAccent,
                                        borderRadius: BorderRadius.circular(
                                            DimemsionApp.radius20)),
                                  ),
                                  SizedBox(
                                    width: DimemsionApp.width15,
                                  ),
                                  Expanded(
                                      child: Container(
                                    height: DimemsionApp.height20 * 5,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        BigText(
                                          text: cart.getItems[index].name!,
                                          color: AppColors.mainBlackColor,
                                        ),
                                        SmallText(text: 'Tasty'),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            BigText(
                                              text: cart.getItems[index].price!
                                                  .toString(),
                                              color: Colors.redAccent,
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical:
                                                      DimemsionApp.width10,
                                                  horizontal:
                                                      DimemsionApp.height10),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          DimemsionApp
                                                              .radius20),
                                                  color: Colors.white),
                                              child: Row(
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      // popularProduct
                                                      //     .setQuantity(false);
                                                    },
                                                    child: const Icon(
                                                      Icons.remove,
                                                      color:
                                                          AppColors.signColor,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        DimemsionApp.width10 /
                                                            2,
                                                  ),
                                                  BigText(
                                                    text: '0',
                                                    // text: popularProduct
                                                    //     .incartItem
                                                    //     .toString()
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        DimemsionApp.width10 /
                                                            2,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      // popularProduct
                                                      //     .setQuantity(true);
                                                    },
                                                    child: const Icon(
                                                      Icons.add,
                                                      color:
                                                          AppColors.signColor,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        DimemsionApp.width10 /
                                                            2,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ))
                                ],
                              ),
                            );
                          }),
                    );
                  })))
        ],
      ),
    );
  }
}
