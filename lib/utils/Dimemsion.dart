import 'package:get/get.dart';

class DimemsionApp {
  static double screenHeight = Get.context!.height;
  static double screenWeight = Get.context!.width;

  static double pageView = screenHeight / 2.9;
  static double pageViewContainer = screenHeight / 4.21;
  static double pageViewTextContainer = screenHeight / 7.71;

  // dynamic height
  static double height10 = screenHeight / 92.6;
  static double height15 = screenHeight / 61.7;
  static double height20 = screenHeight / 46.3;
  static double height30 = screenHeight / 30.8;
  static double height45 = screenHeight / 20.6;

  // dynamic width
  static double width10 = screenHeight / 92.6;
  static double width15 = screenHeight / 61.7;
  static double width20 = screenHeight / 46.3;
  static double width30 = screenHeight / 30.8;

  static double font16 = screenHeight / 57.875;
  static double font20 = screenHeight / 46.3;
  static double font26 = screenHeight / 35.6;
  // dynamic radius
  static double radius15 = screenHeight / 61.7;
  static double radius20 = screenHeight / 46.3;
  static double radius30 = screenHeight / 30.8;

  static double iconSize24 = screenHeight / 38.5;
  static double iconSize16 = screenHeight / 57.875;

  // list view img
  static double lisviewImg = screenWeight / 7.7;
  static double listViewTextContSize = screenWeight / 9.26;

  // popular food
  static double popularFoodImg = screenHeight / 2.64;

  // bottom height
  static double bottomHeight = screenHeight / 7.7;
}
