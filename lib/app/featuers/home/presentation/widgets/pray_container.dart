import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muslim/app/featuers/prayer/presentation/manger/prayer_details_cubit/prayer_details_cubit.dart';

class PrayContainer extends StatelessWidget {
  const PrayContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.2),
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(
              color: Colors.white.withOpacity(0.1),
              width: 1.0,
            ),
          ),
          child: BlocBuilder<PrayerDetailsCubit, PrayerDetailsCubitState>(
            builder: (context, state) {
              if (state is PrayerDetailsCubitSuccess) {
                var prayerTimes = [
                  {
                    'name': 'Fajr',
                    'time': state.prayers[0].time,
                    'icon': "assets/images/fajr.png"
                  },
                  {
                    'name': 'Dhuhr',
                    'time': state.prayers[1].time,
                    'icon': "assets/images/dhuhr.png"
                  },
                  {
                    'name': 'Asr',
                    'time': state.prayers[2].time,
                    'icon': "assets/images/fajr.png"
                  },
                  {
                    'name': 'Maghrib',
                    'time': state.prayers[3].time,
                    'icon': 'assets/images/maghrib.png',
                    'isNext': true
                  },
                  {
                    'name': 'Isha',
                    'time': state.prayers[4].time,
                    'icon': "assets/images/isha.png"
                  },
                ];
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: prayerTimes.map((prayer) {
                    final bool isNext = prayer.containsKey('isNext');
                    return Column(
                      children: [
                        Text(
                          prayer['name'] as String,
                          style: TextStyle(
                            color: isNext ? Colors.orange : Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Image.asset(
                          prayer['icon'] as String,
                          color: isNext ? Colors.orange : Colors.white,
                          height: 28.h,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          prayer['time'] as String,
                          style: TextStyle(
                            color: isNext ? Colors.orange : Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
