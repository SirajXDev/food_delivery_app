import 'package:flutter/material.dart';
import 'package:flutter_application_1/Home/colors.dart';
import 'package:flutter_application_1/Home/food_page_body.dart';
import 'package:flutter_application_1/Models/product_model.dart';
import 'package:flutter_application_1/widgets/big_text.dart';
import 'package:flutter_application_1/widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  //  final int pageId;
  // const   MainFoodPage({super.key, required this.pageId});
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          color: Colors.white,
          child: Container(
            margin: const EdgeInsets.only(top: 50, bottom: 15),
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    BigText(
                      text: 'Bangladesh',
                      color: AppColors.mainColor,
                    ),
                    Row(
                      children: [
                        SmallText(
                          text: 'Narsingdi',
                          color: Colors.black54,
                        ),
                        const Icon(Icons.arrow_drop_down_rounded),
                      ],
                    ),
                  ],
                ),
                Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.mainColor),
                  child: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
           Expanded( child:  SingleChildScrollView(child:   FoodPageBody())),
      ],
    ));
  }
}
