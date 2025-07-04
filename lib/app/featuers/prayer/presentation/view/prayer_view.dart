import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muslim/app/featuers/prayer/presentation/view/widgets/date_selector.dart';
import 'package:muslim/app/featuers/prayer/presentation/view/widgets/hijri_text.dart';
import 'package:muslim/app/featuers/prayer/presentation/view/widgets/location.dart';
import 'package:muslim/app/featuers/prayer/presentation/view/widgets/prayer_container.dart';
import 'package:muslim/app/featuers/prayer/presentation/view/widgets/sala_counter.dart';

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
                height: 200.h,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      LocationTagApp(),
                    ],
                  ),
                  const SalaCounter(),
                  SizedBox(
                    height: 20.h,
                  ),
                  const HijriText(),
                  SizedBox(
                    height: 10.h,
                  ),
                  const DateSelectorScreen(),
                ],
              ),
            ],
          ),
          const Expanded(
            child: PrayerContainer(),
          )
        ],
      ),
    );
  }
}
