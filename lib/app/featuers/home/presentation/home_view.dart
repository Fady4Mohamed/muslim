import 'package:flutter/material.dart';
import 'package:muslim/app/core/utils/app_color.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(
      "home view",
      style: TextStyle(color: AppColor.white),
    ));
  }
}
