import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:muslim/app/core/utils/app_color.dart';
import 'package:muslim/app/featuers/prayer/presentation/widgets/date_selector.dart';
import 'package:muslim/app/featuers/prayer/presentation/widgets/location.dart';
import 'package:muslim/app/featuers/prayer/presentation/widgets/prayer_container.dart';
import 'package:muslim/app/shared/custom_text.dart';

class PrayerView extends StatelessWidget {
  const PrayerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                "assets/images/image 12.png",
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40.h,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      LocationTagApp(),
                    ],
                  ),
                  SvgPicture.asset(
                    'assets/images/fi_1852617.svg',
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomText(
                        text: 'Maghrib will begin in',
                        fontSize: 16,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColor.yellow,
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        padding: EdgeInsets.all(10.h.w),
                        child: const CustomText(
                          text: '-00:37:25',
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  const CustomText(
                    text: "20 Rabi' al-Awal 1446H",
                    fontSize: 16,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  const DateSelectorScreen(),
                ],
              ),
            ],
          ),
          const Expanded(
            child: PrayerContainer(
              prayerName: "fajr",
              dir: 'up',
              time: 'time',
              image: '',
            ),
          )
        ],
      ),
    );
  }
}
