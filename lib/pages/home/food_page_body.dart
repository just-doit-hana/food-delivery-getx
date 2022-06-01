import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/controller/popular_product_controller.dart';
import 'package:food_delivery/model/product_model.dart';
import 'package:food_delivery/pages/food/popular_food_detail.dart';
import 'package:food_delivery/pages/home/recommend_food_detail.dart';
import 'package:food_delivery/router/router_help.dart';
import 'package:food_delivery/utils/app_constant.dart';
import 'package:food_delivery/utils/dimemsion.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/widget/app_column.dart';
import 'package:food_delivery/widget/big_text.dart';
import 'package:food_delivery/widget/icon_and_text_widget.dart';
import 'package:food_delivery/widget/small_text.dart';
import 'package:get/get.dart';

import '../../controller/recomemded_product_controller.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FoodPageBodyState createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  double _currentPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = DimemsionApp.pageViewContainer;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  // ignore: must_call_super
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return popularProducts.isLoaded
              ? SizedBox(
                  // color: Colors.redAccent,
                  height: DimemsionApp.pageView,
                  child: GestureDetector(
                    onTap: () {
                      // Get.toNamed(RouterHelper.getPopularFood());
                    },
                    child: PageView.builder(
                        controller: pageController,
                        itemCount: popularProducts.popularProductList.length,
                        itemBuilder: (context, index) {
                          return _buildPageItem(
                              index, popularProducts.popularProductList[index]);
                        }),
                  ))
              : const CircularProgressIndicator(
                  color: AppColors.mainColor,
                );
        }),

        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return DotsIndicator(
            dotsCount: popularProducts.popularProductList.isEmpty
                ? 1
                : popularProducts.popularProductList.length,
            position: _currentPageValue,
            decorator: DotsDecorator(
              activeColor: AppColors.mainColor,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          );
        }),
        SizedBox(
          height: DimemsionApp.height30,
        ),
        Container(
          margin: EdgeInsets.only(left: DimemsionApp.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: 'Recommendation'),
              SizedBox(
                width: DimemsionApp.width10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(
                  text: '.',
                  color: Colors.black26,
                ),
              ),
              SizedBox(
                width: DimemsionApp.width10,
              ),
              SmallText(text: 'Food pairing')
            ],
          ),
        ),
        // Container(
        //   height: 900,
        //   // color: Colors.red,
        GetBuilder<RecomemdedProductController>(builder: (recommend) {
          return recommend.isLoaded
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: recommend.recommemedProductList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () =>
                          Get.toNamed(RouterHelper.getRecommemedFood(index)),
                      // Get.toNamed(RouterHelper.getRecommemedFood(index)),
                      child: Container(
                        child: Row(
                          children: [
                            Container(
                              height: 120,
                              width: 120,
                              margin: EdgeInsets.only(
                                  left: DimemsionApp.width20,
                                  // right: DimemsionApp.width20,
                                  bottom: DimemsionApp.height10),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          "${AppConstant.BASE_URL}${AppConstant.UPLOAD_URL}/${recommend.recommemedProductList[index].img!}")),
                                  borderRadius: BorderRadius.circular(
                                      DimemsionApp.radius20),
                                  color: index.isEven
                                      ? const Color(0xFF69c5df)
                                      : const Color(0xFF9294cc)),
                            ),
                            Expanded(
                                child: Container(
                              height: 120,
                              // width: 180,
                              decoration: BoxDecoration(
                                  // color: Colors.red,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(
                                          DimemsionApp.radius20),
                                      topRight: Radius.circular(
                                          DimemsionApp.radius20))),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: DimemsionApp.width10,
                                    right: DimemsionApp.width10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    BigText(
                                        text: recommend
                                            .recommemedProductList[index]
                                            .name!),
                                    SizedBox(
                                      height: DimemsionApp.height10,
                                    ),
                                    SmallText(
                                        text: 'with characterist in viet nam '),
                                    SizedBox(
                                      height: DimemsionApp.height10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                  ],
                                ),
                              ),
                            ))
                            // Text container
                          ],
                        ),
                      ),
                    );
                  })
              : const CircularProgressIndicator(
                  color: AppColors.mainColor,
                );
        }),
      ],
    );
  }

  Widget _buildPageItem(int index, ProductModel productModel) {
    Matrix4 matrix4 = Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var currScale = (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 0);
    }
    return Transform(
      transform: matrix4,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () => Get.toNamed(RouterHelper.getPopularFood(index)),
            child: Container(
              height: DimemsionApp.pageViewContainer,
              margin: EdgeInsets.only(
                  left: DimemsionApp.width10,
                  right: DimemsionApp.width10,
                  bottom: DimemsionApp.height10),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "${AppConstant.BASE_URL}${AppConstant.UPLOAD_URL}/${productModel.img!}")),
                  borderRadius: BorderRadius.circular(DimemsionApp.radius30),
                  color: index.isEven
                      ? const Color(0xFF69c5df)
                      : const Color(0xFF9294cc)),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: DimemsionApp.pageViewTextContainer,
              margin: EdgeInsets.only(
                  left: DimemsionApp.width30,
                  right: DimemsionApp.width30,
                  bottom: DimemsionApp.width30),
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5.0,
                      offset: Offset(0, 5),
                    ),
                    BoxShadow(
                        color: Colors.white,
                        // blurRadius: 5.0,
                        offset: Offset(-5, 0)),
                    BoxShadow(
                        color: Color(0xFFe8e8e8),
                        // blurRadius: 5.0,
                        offset: Offset(5, 0))
                  ],
                  borderRadius: BorderRadius.circular(DimemsionApp.radius20),
                  color: Colors.white),
              child: Container(
                  padding: EdgeInsets.only(
                      top: DimemsionApp.height15, left: 15, right: 15),
                  child: AppColumn(
                    text: productModel.name!,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
