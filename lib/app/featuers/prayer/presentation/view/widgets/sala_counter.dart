import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Assuming you're using flutter_screenutil
import 'package:flutter_svg/svg.dart';
import 'package:muslim/app/core/utils/app_color.dart';
import 'package:muslim/app/featuers/home/logic/next_pray.dart';
import 'package:muslim/app/featuers/prayer/data/models/pray_entity_model.dart';
import 'package:muslim/app/featuers/prayer/presentation/manger/prayer_details_cubit/prayer_details_cubit.dart';
import 'dart:async';
import 'package:muslim/app/shared/custom_text.dart';

class SalaCounter extends StatefulWidget {
  const SalaCounter({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SalaCounterState createState() => _SalaCounterState();
}

class _SalaCounterState extends State<SalaCounter> {
  late Timer _timer;
  @override
  void initState() {
    super.initState();
    // Update every second
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrayerDetailsCubit, PrayerDetailsCubitState>(
      builder: (context, state) {
        if (state is PrayerDetailsCubitSuccess) {
          NextPrayerInfo nextPrayerInfo = getNextPrayerInfo(state.prayers);
          PrayEntityModel nextPrayer = nextPrayerInfo.nextPrayer;
          String timeRemaining = nextPrayerInfo.timeRemaining;
          return Column(
            children: [
              (nextPrayer.name == 'Dhuhr')
                  ? SvgPicture.asset(
                      'assets/images/Sunny.svg',
                      height: 60.h,
                    )
                  : (nextPrayer.name == 'Asr')
                      ? SvgPicture.asset(
                          'assets/images/Asr.svg',
                          height: 60.h,
                        )
                      : (nextPrayer.name == 'Magrib' ||
                              nextPrayer.name == 'Fajr')
                          ? SvgPicture.asset(
                              'assets/images/Magrib.svg',
                              height: 60.h,
                            )
                          : SvgPicture.asset(
                              'assets/images/fajrr.svg',
                              height: 60.h,
                            ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: '${nextPrayer.name} will begin in',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColor.white,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color:
                          AppColor.yellow, // Ensure AppColor.yellow is defined
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
                    child: CustomText(
                      text: "-$timeRemaining",
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColor.white,
                    ),
                  ),
                ],
              ),
            ],
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
