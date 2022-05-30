import 'package:food_delivery/controller/popular_product_controller.dart';
import 'package:food_delivery/controller/recomemded_product_controller.dart';
import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:food_delivery/data/repository/recomemeded_product_repo.dart';
import 'package:food_delivery/utils/app_constant.dart';
import 'package:get/get.dart';

Future<void> init() async {
  // api client
  Get.lazyPut(() => ApiClient(apiBaseUrl: AppConstant.BASE_URL));

  // getRepo
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  // getController
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(
      () => RecomemdedProductController(recommendedProductRepo: Get.find()));
}
