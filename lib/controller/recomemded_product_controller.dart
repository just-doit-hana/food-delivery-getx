import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:food_delivery/data/repository/recomemeded_product_repo.dart';
import 'package:food_delivery/model/product_model.dart';
import 'package:get/get.dart';

class RecomemdedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;
  RecomemdedProductController({required this.recommendedProductRepo});
  List<dynamic> _recommemedList = [];
  List<dynamic> get recommemedProductList => _recommemedList;
  bool _isLoaded = false;
  get isLoaded => _isLoaded;

  set isLoaded(value) => _isLoaded = value;

  Future<void> getRecommendedProductList() async {
    Response response = await recommendedProductRepo.getRecommededProductList();
    if (response.statusCode == 200) {
      _isLoaded = true;
      _recommemedList = [];
      _recommemedList.addAll(Product.fromJson(response.body).products);
      update();
      // print(_recommemedList);
    } else {
      printError(info: 'NOt get recommendation');
    }
  }
}
