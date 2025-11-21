import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';
import 'package:muslim/app/featuers/home/logic/next_pray.dart';
import 'package:muslim/app/featuers/prayer/data/models/pray_entity_model.dart';
import 'package:muslim/app/featuers/prayer/presentation/manger/prayer_details_cubit/prayer_details_cubit.dart';

class PrayContainer extends StatelessWidget {
  const PrayContainer({super.key});

  static const List<Map<String, String>> _prayerTemplates = [
    {
      'name': 'Fajr',
      'icon': 'assets/images/fajr.png',
      'nextPrayerName': 'Dhuhr',
    },
    {
      'name': 'Dhuhr',
      'icon': 'assets/images/dhuhr.png',
      'nextPrayerName': 'Asr',
    },
    {
      'name': 'Asr',
      'icon': 'assets/images/fajr.png',
      'nextPrayerName': 'Maghrib',
    },
    {
      'name': 'Maghrib',
      'icon': 'assets/images/maghrib.png',
      'nextPrayerName': 'Isha',
    },
    {
      'name': 'Isha',
      'icon': 'assets/images/isha.png',
      'nextPrayerName': 'Fajr',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: LiquidGlass(
        glassContainsChild: false,
        settings: const LiquidGlassSettings(
            blur: 3,
            refractiveIndex: 1.5,
            ambientStrength: 2,
            chromaticAberration: 5),
        shape: const LiquidRoundedRectangle(borderRadius: Radius.circular(12)),
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
                final nextPrayerInfo = getNextPrayerInfo(state.prayers);
                final nextPrayerName = nextPrayerInfo.nextPrayer.name;

                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: _buildPrayerTimes(state.prayers, nextPrayerName),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  List<Widget> _buildPrayerTimes(
      List<PrayEntityModel> prayers, String nextPrayerName) {
    return List.generate(_prayerTemplates.length, (index) {
      final template = _prayerTemplates[index];
      final prayer = prayers[index];
      final isNext = template['nextPrayerName'] == nextPrayerName;

      return _PrayerTimeItem(
        name: template['name']!,
        time: prayer.time,
        icon: template['icon']!,
        isNext: isNext,
      );
    });
  }
}

// Separate widget for each prayer time item to optimize performance
class _PrayerTimeItem extends StatelessWidget {
  final String name;
  final String time;
  final String icon;
  final bool isNext;

  const _PrayerTimeItem({
    required this.name,
    required this.time,
    required this.icon,
    required this.isNext,
  });

  @override
  Widget build(BuildContext context) {
    final color = isNext ? Colors.orange : Colors.white;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          name,
          style: TextStyle(
            color: color,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        Image.asset(
          icon,
          color: color,
          height: 28.h,
          // Add cacheWidth and cacheHeight for better memory management
          cacheWidth: (28 * MediaQuery.of(context).devicePixelRatio).round(),
        ),
        const SizedBox(height: 12),
        Text(
          time,
          style: TextStyle(
            color: color,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
