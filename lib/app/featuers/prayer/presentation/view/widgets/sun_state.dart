import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:muslim/app/featuers/prayer/presentation/manger/prayer_details_cubit/prayer_details_cubit.dart';

class SunState extends StatefulWidget {
  const SunState({super.key});

  @override
  State<SunState> createState() => _SunStateState();
}

class _SunStateState extends State<SunState> {
  int isNowWithinRange() {
   
    final List<Map<String, int>> ranges = [
      {'startHour': 4, 'startMinute': 28, 'endHour': 12, 'endMinute': 56, 'value': 1},
      {'startHour': 12, 'startMinute': 57, 'endHour': 16, 'endMinute': 34, 'value': 2},
      {'startHour': 16, 'startMinute': 35, 'endHour': 19, 'endMinute': 45, 'value': 3},
      {'startHour': 19, 'startMinute': 45, 'endHour': 21, 'endMinute': 13, 'value': 4},
      {'startHour': 21, 'startMinute': 15, 'endHour': 4, 'endMinute': 27, 'value': 5},
    ];

    DateTime now = DateTime.now();
    int nowMinutes = now.hour * 60 + now.minute;

    
    for (var range in ranges) {
      int startMinutes = range['startHour']! * 60 + range['startMinute']!;
      int endMinutes = range['endHour']! * 60 + range['endMinute']!;

      
      if (endMinutes < startMinutes) {
        
        if (nowMinutes >= startMinutes || nowMinutes <= endMinutes) {
          return range['value']!;
        }
      } else {
      
        if (nowMinutes >= startMinutes && nowMinutes <= endMinutes) {
          return range['value']!;
        }
      }
    }

    return 0;  
  }

  @override
  Widget build(BuildContext context) {
    int inRange = isNowWithinRange();
    return BlocBuilder<PrayerDetailsCubit, PrayerDetailsCubitState>(
      builder: (context, state) {
        if (state is PrayerDetailsCubitSuccess) {
          if (inRange == 1) {
            return SvgPicture.asset(
              'assets/images/fajrr.svg',
            );
          } else if (inRange == 2) {
            return SvgPicture.asset(
              'assets/images/Sunny.svg',
            );
          } else if (inRange == 3) {
            return SvgPicture.asset(
              'assets/images/Asr.svg',
            );
          } else if (inRange == 4) {
            return SvgPicture.asset(
              'assets/images/Magrib.svg',
            );
          } else {
            return SvgPicture.asset(
              'assets/images/fajrr.svg',
            );
          }
        } else if (state is PrayerDetailsCubitFauilre) {
          return Text("Error: ${state.errMessage}");
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
