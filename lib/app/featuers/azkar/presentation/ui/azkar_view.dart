import 'package:flutter/material.dart';
import 'package:muslim/app/core/utils/app_color.dart';
import 'package:muslim/app/featuers/azkar/presentation/ui/azkar_button.dart';
import 'package:muslim/app/shared/custom_text.dart';

class AzkarView extends StatelessWidget {
  const AzkarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.mainColor,
        title: const Center(child: CustomText(text: "الأذكار", fontSize: 32)),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        children: const [
          AzkarButton(azkarName: 'azkarName'),
          AzkarButton(azkarName: 'azkarName'),
          AzkarButton(azkarName: 'azkarName'),
          AzkarButton(azkarName: 'azkarName'),
          AzkarButton(azkarName: 'azkarName'),
          AzkarButton(azkarName: 'azkarName'),
        ],
      ),
    );
  }
}
