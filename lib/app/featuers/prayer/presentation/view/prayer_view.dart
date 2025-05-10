import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muslim/app/core/api/api_service.dart';
import 'package:muslim/app/featuers/prayer/data/repos/prayer_repo_impl.dart';
import 'package:muslim/app/featuers/prayer/presentation/manger/prayer_details_cubit/prayer_details_cubit.dart';
import 'package:muslim/app/featuers/prayer/presentation/view/widgets/date_selector.dart';
import 'package:muslim/app/featuers/prayer/presentation/view/widgets/hijri_text.dart';
import 'package:muslim/app/featuers/prayer/presentation/view/widgets/location.dart';
import 'package:muslim/app/featuers/prayer/presentation/view/widgets/prayer_container.dart';
import 'package:muslim/app/featuers/prayer/presentation/view/widgets/sala_counter.dart';
import 'package:muslim/app/featuers/prayer/presentation/view/widgets/sun_state.dart';

class PrayerView extends StatelessWidget {
  const PrayerView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PrayerDetailsCubit(
        PrayerRepoImpl(
          ApiServices(
            Dio(),
          ),
        ),
      )..fetchPrayerDetails(),
      child: Scaffold(
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
                    const SunState(),
                    SizedBox(
                      height: 10.h,
                    ),
                    const SalaCounter(),
                    SizedBox(
                      height: 20.h,
                    ),
                    const HijriText(),
                    SizedBox(
                      height: 40.h,
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
      ),
    );
  }
}
