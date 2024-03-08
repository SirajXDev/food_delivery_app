import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controller/popular_product_controller.dart';
import 'package:flutter_application_1/Home/colors.dart';
import 'package:flutter_application_1/widgets/big_text.dart';
import 'package:flutter_application_1/widgets/icon_and_text.dart';
import 'package:flutter_application_1/widgets/small_text.dart';

class AppColumn extends StatelessWidget {
  const AppColumn({super.key, required text});

  @override
  Widget build(BuildContext context) {
    
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      
      children: [
        BigText(text: 'chinese side'),
        const SizedBox(
          height: 10,
        ),
        Row(
         
          
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
        ),
      ],
    );
  }
}