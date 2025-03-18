import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:muslim/app/core/routing/app_router.dart';
import 'package:muslim/app/core/utils/app_color.dart';
import 'package:muslim/app/shared/custom_text.dart';

class AzkarButton extends StatelessWidget {
  const AzkarButton({super.key, required this.azkarName});
  final String azkarName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        
        GoRouter.of(context).push(AppRouter.azkarPage);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.08,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColor.mainColorLight,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: AppColor.secondaryColor, // Outline color
              width: 1, // Outline thickness
            ),
          ),
          child: Center(
            child: CustomText(text: azkarName, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
