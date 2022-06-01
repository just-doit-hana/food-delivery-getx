import 'package:flutter/material.dart';
import 'package:food_delivery/controller/cart_controller.dart';
import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:food_delivery/model/cart_model.dart';
import 'package:food_delivery/model/product_model.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  late CartController _cart;

  List<dynamic> _poprularList = [];
  List<dynamic> get popularProductList => _poprularList;

  // get load from api
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
    }
  }

  // cart list

  int _quantity = 0;
  // to display text
  int get quantity => _quantity;
  int _inCartItem = 0;
  int get incartItem => _inCartItem + _quantity;

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      // print('tang');
      _quantity = checkQuantity(_quantity + 1);
    } else {
      // print('giam');
      _quantity = checkQuantity(_quantity - 1);
    }
    // update to display ui
    update();
  }

  int checkQuantity(int quantity) {
    if ((quantity + _inCartItem) < 0) {
      Get.snackbar('Item count', 'You cant reduce more',
          colorText: Colors.white, backgroundColor: AppColors.mainColor);

      if (_inCartItem > 0) {
        _quantity = -incartItem;
        return _quantity;
      }
      return 0;
    } else if (quantity + _inCartItem > 20) {
      Get.snackbar('Item count', 'You cant not add more',
          colorText: Colors.white, backgroundColor: AppColors.mainColor);
      return 20;
    } else {
      return quantity;
    }
  }

//  init product get from shared preferned
  void initProduct(ProductModel product, CartController cart) {
    _quantity = 0;
    // if exist --> 3: total product in cart + 1 = 4
    _inCartItem = 0; // get inCartItems  storage from shared peferend
    _cart = cart;
    var exist = false;
    exist = _cart.existInCart(product);
    // print('Exist or not:' + exist.toString());
    if (exist) {
      _inCartItem = _cart.getQuantity(product);
      // print('The quantity in cart:' + _inCartItem.toString());
    }
  }

  void addItem(ProductModel product) {
    // if (_quantity > 0) {
    _cart.addItem(product, _quantity);
    _quantity = 0;
    _inCartItem = _cart.getQuantity(product);
    _cart.items.forEach((key, value) {
      print('The id is:${value.id}The quantity is: ${value.quantity}');
    });
    update();
    // } else {
    // Get.snackbar('Item count', 'You should add least add an item in cart',
    //     colorText: Colors.white, backgroundColor: AppColors.mainColor);
    // }
  }

  int get totalItems {
    return _cart.totalItem;
  }

  // get list cart
  List<CartModel> get getItems {
    return _cart.getItems;
  }
}
