import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controller/popular_product_controller.dart';
import 'package:flutter_application_1/Controller/recommended_product_controller.dart';
import 'package:flutter_application_1/Home/app_constants.dart';
import 'package:flutter_application_1/Home/colors.dart';
import 'package:flutter_application_1/routes/route_helper.dart';
import 'package:flutter_application_1/widgets/big_text.dart';
import 'package:flutter_application_1/widgets/icon_and_text.dart';
import 'package:flutter_application_1/widgets/small_text.dart';
import 'package:get/get.dart';

class FoodPageBody extends StatefulWidget {
    //final int pageId;

  // FoodPageBody({super.key, required this.pageId});
 // var product = Get.find<RecommendedProductController>().recommendedProductList[pageId];
  
  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  
  PageController pageController = PageController(viewportFraction: 0.85);
  var currPageValue = 0.0;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        currPageValue = pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
 
    return Column(
      children: [
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return popularProducts.isLoaded
              ? Container(
                  height: 320,
                  child: PageView.builder(
                      controller: pageController,
                      itemCount: popularProducts.popularProductList.length,
                      itemBuilder: (context, index) {
                        return _buildPageItem(
                            index, popularProducts.popularProductList[index]);
                      }),
                )
              : Container(
                  height: 320,
                  child: const Center(
                      child: CircularProgressIndicator(
                    color: AppColors.mainColor,
                  )));
        }),

        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return DotsIndicator(
            dotsCount: popularProducts.popularProductList.isEmpty
                ? 1
                : popularProducts.popularProductList.length,
            position: currPageValue,
            decorator: DotsDecorator(
              activeColor: AppColors.mainColor,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          );
        }),

        //popular section
        const SizedBox(
          height: 30,
        ),
        Container(
            margin: const EdgeInsets.only(left: 30, right: 30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                BigText(text: 'Recommended'),
                const SizedBox(
                  width: 10,
                ),
                Container(
                    margin: const EdgeInsets.only(bottom: 3),
                    child: BigText(
                      text: '.',
                      color: Colors.black26,
                    )),
                const SizedBox(
                  width: 10,
                ),
                Container(
                    margin: const EdgeInsets.only(bottom: 3),
                    child: SmallText(
                      text: 'Food pairing',
                      color: Colors.black26,
                    )),
              ],
            )),
        GetBuilder<RecommendedProductController>(builder: (recommendedProduct) {
          return recommendedProduct.isLoaded
              ? ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: recommendedProduct.recommendedProductList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.getRecommendedFood(index));
                       
                      },
                      child: Container(
                        margin: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 10),
                        child: Row(
                          children: [
                            Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white38,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                       // AppConstants.BASE_URL+AppConstants.UPLOAD_URL+recommendedProduct.img!
                                      "${AppConstants.BASE_URL}/uploads/${recommendedProduct.recommendedProductList[index].img!}"),
                                ),
                              ),
                            ),
                            //text and icon section
                            Expanded(
                              child: Container(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                height: 100,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                    )),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    BigText(
                                         text: recommendedProduct
                                             .recommendedProductList[index]
                                             .name!
                                         
                                         ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SmallText(
                                        text: 'with chines charateristics'),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Row(
                                      children: [
                                        IconAndTextWidget(
                                            icon: Icons.circle_sharp,
                                            text: 'Normal',
                                            iconColor: AppColors.iconColor1),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        IconAndTextWidget(
                                            icon: Icons.location_on,
                                            text: '1.7km',
                                            iconColor: AppColors.mainColor),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        IconAndTextWidget(
                                            icon: Icons.access_time_rounded,
                                            text: '32min',
                                            iconColor: AppColors.iconColor2),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  })
              : const CircularProgressIndicator(
                  color: AppColors.mainColor,
                );
        })
      ],
    );
  }
}

Widget _buildPageItem(
  int index,
  popularProduct,
) {

  var product;
  return Stack(
    children: [
      GestureDetector(
        onTap: () {
          Get.toNamed(RouteHelper.getPopularFood(index));
        },
        child: Container(
          height: 220,
          margin: const EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(AppConstants.BASE_URL +
                        AppConstants.UPLOAD_URL +
                        popularProduct.img!
                    // or
                    //"${AppConstants.BASE_URL}/uploads/${popularProduct.img!}"
                    ),
              ),
              borderRadius: BorderRadius.circular(30),
              color: index.isEven ? Colors.amber : const Color(0xFF45cc4d)),
        ),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 120,
          margin: const EdgeInsets.only(
            left: 30,
            right: 30,
            bottom: 30,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Color(0xFFeBeBeB),
                  offset: Offset(0, 5),
                )
              ]),
          child: Container(
            padding: const EdgeInsets.only(
              top: 15,
              left: 15,
              right: 15,
            ),
            child: Column(
            
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
               
                BigText(text: popularProduct.name!),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Wrap(
                        children: List.generate(
                      5,
                      (index) => const Icon(
                        Icons.star,
                        color: AppColors.mainColor,
                        size: 15,
                      ),
                    )),
                    SmallText(text: '4.5'),
                    const SizedBox(
                      width: 10,
                    ),
                    SmallText(text: '1287'),
                    SmallText(text: 'comments'),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  children: [
                    IconAndTextWidget(
                        icon: Icons.circle_sharp,
                        text: 'Normal',
                        iconColor: AppColors.iconColor1),
                    SizedBox(
                      width: 10,
                    ),
                    IconAndTextWidget(
                        icon: Icons.location_on,
                        text: '1.7km',
                        iconColor: AppColors.mainColor),
                    SizedBox(
                      width: 10,
                    ),
                    IconAndTextWidget(
                        icon: Icons.access_time_rounded,
                        text: '32min',
                        iconColor: AppColors.iconColor2),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
