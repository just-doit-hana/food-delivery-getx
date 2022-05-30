import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:food_delivery/model/product_model.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<dynamic> _poprularList = [];
  List<dynamic> get popularProductList => _poprularList;
  bool _isLoaded = false;
  get isLoaded => _isLoaded;

  set isLoaded(value) => _isLoaded = value;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      _isLoaded = true;
      _poprularList = [];
      _poprularList.addAll(Product.fromJson(response.body).products);
      update();
      // print(_poprularList);
    }
  }
}
