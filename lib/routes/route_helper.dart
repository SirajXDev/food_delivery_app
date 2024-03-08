import 'package:flutter_application_1/Home/main_food_page.dart';
 import 'package:flutter_application_1/Home/popular_food.dart';
 import 'package:flutter_application_1/Home/recomended_food.dart';
 import 'package:get/get.dart';

 class RouteHelper{
  static const String initial='/';
   static const String popularFood="/popular_food";
   static const String recommendedFood="/recommended_food";
  
   static String getInitial()=>'$initial';
   static String getPopularFood(int pageId)=>'$popularFood?pageId=$pageId';
   static String getRecommendedFood(int pageId)=>'$recommendedFood?pageId=$pageId';

   static List<GetPage> routes=[
     GetPage(name: initial, page:()=> const MainFoodPage()),
   
     GetPage(name: popularFood, page:(){
        var pageId= Get.parameters['pageId'];
       return  PopularFoodDetail(pageId:int.parse(pageId!));
     },
    
       transition: Transition.fadeIn
     ),
      GetPage(name: recommendedFood, page:(){
         var pageId = Get.parameters['pageId'];
       return   RecomendedFoodDetail(pageId:int.parse(pageId!));
     },
    
       transition: Transition.fadeIn
     ),
    //   GetPage(name: FoodPageBody, page:(){
    //      var pageId = Get.parameters['pageId'];
    //    return   FoodPageBody(pageId:int.parse(pageId!));
    //  },
    
    //    transition: Transition.fadeIn
    //  ),


   ];
 }