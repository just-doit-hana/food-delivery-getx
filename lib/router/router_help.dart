import 'package:food_delivery/err/unknown_page.dart';
import 'package:food_delivery/pages/food/popular_food_detail.dart';
import 'package:food_delivery/pages/home/main_food_pages.dart';
import 'package:food_delivery/pages/home/recommend_food_detail.dart';
import 'package:get/get.dart';

class RouterHelper {
  static const String initial = "/";
  static String getInitial() => initial;
  static const String unknownPage = "/not-found";

  static const String popularFood = "/popular-food";
  static String getPopularFood(int pageId) => '$popularFood?pageId=$pageId';

  static const String recommended = "/recommended-food";
  static String getRecommemedFood(int pageId) => '$recommended?pageId=$pageId';

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => const MainFoodPages()),
    GetPage(name: unknownPage, page: () => const UnknownRoutePage()),
    GetPage(
        name: popularFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          return PopularFoodDetail(pageId: int.parse(pageId!));
        }),
    GetPage(
        name: recommended,
        page: () {
          var pageId = Get.parameters['pageId'];
          return RecommendFoodDetail(pageId: int.parse(pageId!));
        },
        transition: Transition.fadeIn)
  ];
}
