import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Assuming you're using flutter_screenutil
import 'package:muslim/app/core/utils/app_color.dart';
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
  late Map<String, dynamic> _salahInfo;
  String _countdown = '';

  @override
  void initState() {
    super.initState();
    _updateSalahInfo();
    // Update every second
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _updateCountdown();
    });
  }

  void _updateSalahInfo() {
    setState(() {
      _salahInfo = getSalahInfo();
      _updateCountdown();
    });
  }

  void _updateCountdown() {
    DateTime now = DateTime.now();
    DateTime nextSalah = _salahInfo['nextStart'];
    Duration difference = nextSalah.difference(now);

    if (difference.isNegative) {
      // If the next Salah time has passed, update Salah info
      _updateSalahInfo();
      return;
    }

    int hours = difference.inHours;
    int minutes = difference.inMinutes % 60;
    int seconds = difference.inSeconds % 60;

    setState(() {
      _countdown = '-${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(
          text: '${_salahInfo['name']} will begin in',
          fontSize: 16,
        ),
        SizedBox(
          width: 10.w,
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColor.yellow, // Ensure AppColor.yellow is defined
            borderRadius: BorderRadius.circular(15.r),
          ),
          padding: EdgeInsets.all(10.h.w),
          child: CustomText(
            text: _countdown,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}





Map<String, dynamic> getSalahInfo() {
  final List<Map<String, dynamic>> ranges = [
    {
      'startHour': 4,
      'startMinute': 28,
      'endHour': 12,
      'endMinute': 56,
      'value': 1,
      'name': 'Fajr',
      'nextHour': 12,
      'nextMinute': 57,
    }, // Next: Dhuhr
    {
      'startHour': 12,
      'startMinute': 57,
      'endHour': 16,
      'endMinute': 34,
      'value': 2,
      'name': 'Dhuhr',
      'nextHour': 16,
      'nextMinute': 35,
    }, // Next: Asr
    {
      'startHour': 16,
      'startMinute': 35,
      'endHour': 19,
      'endMinute': 45,
      'value': 3,
      'name': 'Asr',
      'nextHour': 19,
      'nextMinute': 45,
    }, // Next: Maghrib
    {
      'startHour': 19,
      'startMinute': 45,
      'endHour': 21,
      'endMinute': 13,
      'value': 4,
      'name': 'Maghrib',
      'nextHour': 21,
      'nextMinute': 15,
    }, // Next: Isha
    {
      'startHour': 21,
      'startMinute': 15,
      'endHour': 4,
      'endMinute': 27,
      'value': 5,
      'name': 'Isha',
      'nextHour': 4,
      'nextMinute': 28,
    }, // Next: Fajr (next day)
  ];

  DateTime now = DateTime.now();
  int nowMinutes = now.hour * 60 + now.minute;

  for (var range in ranges) {
    int startMinutes = (range['startHour'] as int) * 60 + (range['startMinute'] as int);
    int endMinutes = (range['endHour'] as int) * 60 + (range['endMinute'] as int);
    int nextHour = range['nextHour'] as int;
    int nextMinute = range['nextMinute'] as int;

    bool isWithinRange;
    if (endMinutes < startMinutes) {
      // Range crosses midnight (e.g., Isha)
      isWithinRange = nowMinutes >= startMinutes || nowMinutes <= endMinutes;
    } else {
      // Normal range
      isWithinRange = nowMinutes >= startMinutes && nowMinutes <= endMinutes;
    }

    if (isWithinRange) {
      // Calculate nextStart, adding a day if the next Salah is on the next day
      DateTime nextStart = DateTime(
        now.year,
        now.month,
        now.day,
        nextHour,
        nextMinute,
      );
      if (nextHour < range['startHour'] || (nextHour == range['startHour'] && nextMinute < range['startMinute'])) {
        nextStart = nextStart.add(const Duration(days: 1));
      }

      return {
        'value': range['value'],
        'name': range['name'],
        'nextStart': nextStart,
      };
    }
  }

  // Default case: After Isha's end (4:27 AM) but before Fajr's start (4:28 AM)
  DateTime nextFajr = DateTime(now.year, now.month, now.day, 4, 28);
  if (now.hour < 4 || (now.hour == 4 && now.minute < 28)) {
    // Before Fajr on the same day
    nextFajr = DateTime(now.year, now.month, now.day, 4, 28);
  } else {
    // After Fajr, so next Fajr is tomorrow
    nextFajr = DateTime(now.year, now.month, now.day + 1, 4, 28);
  }

  return {
    'value': 5,
    'name': 'Isha',
    'nextStart': nextFajr,
  };
}