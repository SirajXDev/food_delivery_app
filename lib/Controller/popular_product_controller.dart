import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controller/cart_controller.dart';
import 'package:flutter_application_1/Home/colors.dart';
import 'package:flutter_application_1/Repository/popular_product_repo.dart';
import 'package:flutter_application_1/models/product_model.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;
  late CartController _cart;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;
  int _quantity = 0;
  int _inCartItems = 0;
  int get quantity => _quantity;
  int get inCartItems => _inCartItems + _quantity;
  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      print('got products');
      _popularProductList = [];

      _popularProductList.addAll(Product.fromJson(response.body).products);
      // print(_popularProductList);
      _isLoaded = true;
      update();
    } else {}
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      print('increment$_quantity');
      //print('increment'+_quantity.toString());
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
      print('decrement$_quantity');
    }
    update();
  }

  checkQuantity(int quantity) {
    if (quantity < 0) {
      Get.snackbar(
        "item count",
        "you can not reduce more",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return 0;
    } else if (quantity > 20) {
      Get.snackbar(
        "item count",
        "you can not add more",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct(CartController cart) {
    _quantity = 0;
    _inCartItems = 0;
    _cart=cart;
  }

  void addItem( product) {
    if(_quantity>0){
      _cart.addItem(product , _quantity);

      _cart.items.forEach((key, value) { 
        print('the id is'+value.id.toString()+'the quantity is'+value.quantity.toString());
      });
    }else{

       Get.snackbar(
        "item count",
        "you should add item in this cart ",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
    }
    
  }
}
