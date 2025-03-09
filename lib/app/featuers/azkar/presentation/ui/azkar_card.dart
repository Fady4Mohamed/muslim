import 'package:flutter/material.dart';
import 'package:muslim/app/core/utils/app_color.dart';
import 'package:muslim/app/core/utils/app_images.dart';
import 'package:muslim/app/shared/custom_image.dart';
import 'package:muslim/app/shared/custom_text.dart';

class AzkarCard extends StatelessWidget {
  const AzkarCard({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: AppColor.secondaryColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: const Stack(
        children: [
          Positioned(
            left: -5,
            right: -5,
            bottom: -10,
            child: CustomImageAsset(
              height: 120,
              width: 400,
              imagePath: AppImages.bottomImage,
            ),
          ),
          Positioned(
            child: CustomImageAsset(
              imagePath: AppImages.centerImage,
            ),
          ),
          Positioned(
            right: 8,
            top: 12,
            child: CustomImageAsset(
              height: 100,
              width: 120,
              imagePath: AppImages.rightCornerImage,
            ),
          ),
          Positioned(
            left: 8,
            top: 12,
            child: CustomImageAsset(
              height: 100,
              width: 120,
              imagePath: AppImages.leftCornerImage,
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  SizedBox(height: 50),
                  CustomText(
                      text: 'عنوان', fontSize: 30, fontWeight: FontWeight.bold),
                  Spacer(flex: 1),
                  CustomText(maxLines: 200, text: 'الاذكار', fontSize: 22),
                  Spacer(flex: 2),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
