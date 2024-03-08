import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controller/recommended_product_controller.dart';
import 'package:flutter_application_1/Home/app_constants.dart';
import 'package:flutter_application_1/Home/colors.dart';
import 'package:flutter_application_1/routes/route_helper.dart';
import 'package:flutter_application_1/widgets/app_icon.dart';
import 'package:flutter_application_1/widgets/big_text.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class RecomendedFoodDetail extends StatelessWidget {
  final int pageId;

  const RecomendedFoodDetail({super.key, required this.pageId});
  @override
  Widget build(BuildContext context) {
    var product = Get.find<RecommendedProductController>().recommendedProductList[pageId];
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getInitial());
                    },
                    child: const AppIcon(icon: Icons.clear)),
                const AppIcon(icon: Icons.shopping_cart_checkout_outlined),
              ],
            ),
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(20),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      )),
                  width: double.maxFinite,
                  padding: const EdgeInsets.only(
                    top: 5,
                    bottom: 10,
                  ),
                  child: Center(child: BigText(text:product.name! )),
                )),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                AppConstants.BASE_URL+AppConstants.UPLOAD_URL+product.img!,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              
              margin: const EdgeInsets.only(left: 20, right: 20),
              child:  ReadMoreText(
                product.description!
               
                ,
                trimLines: 6,
                colorClickableText: Colors.pink,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'Show more',
                trimExpandedText: 'Show less',
                moreStyle:   const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.mainColor),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding:
                const EdgeInsets.only(left: 50, right: 50, top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const AppIcon(
                  icon: Icons.remove,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                ),
                BigText(
                  text: "\$ ${product.price!}  X  0",
                  color: AppColors.mainBlackColor,
                  size: 26,
                ),
                const AppIcon(
                  icon: Icons.add,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                ),
              ],
            ),
          ),
          Container(
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
                    child: const Icon(
                      Icons.favorite,
                      color: AppColors.mainColor,
                    )),
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
                  child: BigText(
                    text: '\$10 | Add to cart',
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
