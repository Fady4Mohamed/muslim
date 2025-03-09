import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muslim/app/core/utils/app_color.dart';
import 'package:muslim/app/core/utils/app_images.dart';
import 'package:muslim/app/featuers/azkar/presentation/azkar_view.dart';
import 'package:muslim/app/featuers/home/presentation/home_view.dart';
import 'package:muslim/app/featuers/prayer/presentation/prayer_view.dart';
import 'package:muslim/app/featuers/qibla/logic/cubit/qiblah_cubit.dart';
import 'package:muslim/app/featuers/qibla/presentation/qiblah_view.dart';
import 'package:muslim/app/shared/custom_image.dart';

class CustomPageNavigationBar extends StatefulWidget {
  const CustomPageNavigationBar({super.key});

  @override
  State<CustomPageNavigationBar> createState() =>
      _CustomPageNavigationBarState();
}

class _CustomPageNavigationBarState extends State<CustomPageNavigationBar> {
  int currentIndex = 0; //

  final List<Widget> pages = [
    const HomeView(),
    const PrayerView(),
    const AzkarView(),
    BlocProvider(
      create: (context) => QiblahCubit()..getQiblaDirection(),
      child: const QiblahView(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.mainColor,
      body: pages[currentIndex],
      bottomNavigationBar: Container(
        height: 80.h,
        decoration: const BoxDecoration(
          color: AppColor.mainColorLight,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildNavIcon(
                currentIndex == 0
                    ? AppImages.iconsHomeEnabled
                    : AppImages.iconsHome,
                0),
            _buildNavIcon(
                currentIndex == 1
                    ? AppImages.iconsPrayerEnabled
                    : AppImages.iconsPrayer,
                1),
            _buildNavIcon(
                currentIndex == 2
                    ? AppImages.iconsAzkarEnabled
                    : AppImages.iconsAzkar,
                2),
            _buildNavIcon(
                currentIndex == 3
                    ? AppImages.iconsQiblaEnabled
                    : AppImages.iconsQibla,
                3),
          ],
        ),
      ),
    );
  }

  Widget _buildNavIcon(String iconPath, int pageIndex) {
    return Expanded(
      child: TextButton(
        style: ButtonStyle(
            shape: WidgetStateProperty.all(
                const RoundedRectangleBorder(borderRadius: BorderRadius.zero))),
        onPressed: () {
          setState(() {
            currentIndex = pageIndex;
          });
        },
        child: CustomImageAsset(imagePath: iconPath),
      ),
    );
  }
}
