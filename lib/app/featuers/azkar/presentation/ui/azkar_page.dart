import 'package:flutter/material.dart';
import 'package:muslim/app/core/utils/app_color.dart';
import 'package:muslim/app/featuers/azkar/presentation/ui/azkar_card.dart';
import 'package:muslim/app/shared/custom_text.dart';

class AzkarPage extends StatelessWidget {
  const AzkarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.mainColor,
        centerTitle: true,
        title: const CustomText(text: "اذكار الصباح", fontSize: 32),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        child: AzkarCard(),
      ),
    );
  }
}
