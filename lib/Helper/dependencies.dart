import 'package:flutter_application_1/Controller/cart_controller.dart';
import 'package:flutter_application_1/Controller/popular_product_controller.dart';
import 'package:flutter_application_1/Controller/recommended_product_controller.dart';
import 'package:flutter_application_1/Data/Api/api_client.dart';
import 'package:flutter_application_1/Home/app_constants.dart';
import 'package:flutter_application_1/Repository/cart_repo.dart';
import 'package:flutter_application_1/Repository/popular_product_repo.dart';
import 'package:flutter_application_1/Repository/recommended_product_repo.dart';
import 'package:get/get.dart';

Future<void> init() async {
  //apiClient
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));
  //repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo());

  //controller
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}
