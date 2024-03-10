import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controller/cart_controller.dart';
import 'package:flutter_application_1/Controller/popular_product_controller.dart';
import 'package:flutter_application_1/Home/app_constants.dart';
import 'package:flutter_application_1/Home/colors.dart';
import 'package:flutter_application_1/Home/main_food_page.dart';
import 'package:flutter_application_1/widgets/app_icon.dart';
import 'package:flutter_application_1/widgets/big_text.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';


class PopularFoodDetail extends StatelessWidget {
  final int  pageId;
  const    PopularFoodDetail({super.key,required this.pageId});
 
  @override
  Widget build(BuildContext context) {
    var product = Get.find<PopularProductController>().popularProductList[pageId];
    
      Get.find<PopularProductController>().initProduct(Get.find<CartController>());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //background image
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 350,
                decoration:  BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          AppConstants.BASE_URL+AppConstants.UPLOAD_URL+ product.img!
                          ))),
              )),
          //icon widget
           Positioned(
            left: 20,
            right: 20,
            top: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(()=>const  MainFoodPage());
                  },
                  child: const AppIcon(icon: Icons.arrow_back_ios)),
                const AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
          ),
          //introduction fo food
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: 470 - 120,
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: product.name!),
                    const SizedBox(
                      height: 20,
                    ),
                    BigText(text: 'Introduce'),
                    Expanded(
                     child: SingleChildScrollView(
                       child: ReadMoreText(
                                    product.description!
                                      , 
                                       trimLines: 6,
                                       colorClickableText: Colors.pink,
                                       trimMode: TrimMode.Line,
                                       trimCollapsedText: 'Show more',
                                       trimExpandedText: 'Show less',
                                       moreStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: AppColors.mainColor),
                                     ),
                     ),
                   ),
                  
                    
                 
                  ],
                ),
              )),
        ],
      ),
      
      
      bottomNavigationBar:
      GetBuilder<PopularProductController>(builder: (popularProduct){
        return Container(
        height: 120,
        padding:
            const EdgeInsets.only(top: 30, bottom: 30, left: 20, right: 20),
        decoration: const BoxDecoration(
            color: AppColors.buttonBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(
                top: 20,
                bottom: 20,
                left: 20,
                right: 20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Row(
                children: [
                        GestureDetector(
                    onTap: () {
                      popularProduct.setQuantity(false);
                    },
                    child: const Icon(
                      Icons.remove,
                      color: AppColors.signColor,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  BigText(text: popularProduct.quantity.toString()),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      popularProduct.setQuantity(true);
                    },
                    child: const Icon(
                      Icons.add,
                      color: AppColors.signColor,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                top: 20,
                bottom: 20,
                left: 20,
                right: 20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.mainColor,
              ),
              child: GestureDetector(
                onTap: () {
                  popularProduct.addItem(product);
                },
                child: BigText(
                  text: "\$ ${product.price!} | Add to cart",
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      
      );
      }),
    );
  }
}
