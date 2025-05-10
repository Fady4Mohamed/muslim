import 'package:flutter/material.dart';
import 'package:muslim/app/core/utils/app_color.dart';
import 'package:muslim/app/featuers/azkar/ui/azkar_details_card.dart';
import 'package:muslim/app/shared/custom_text.dart';

class AzkarPage extends StatelessWidget {
  const AzkarPage({super.key, required this.id, required this.title});
  final int id;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.mainColor,
        centerTitle: true,
        title: CustomText(text: title, fontSize: 32),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
          child: AzkarDetailsCard(
            isHome: false,
            title: title,
            id: id,
          ),
        ),
      ),
    );
  }
}
