import 'dart:async';
import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim/app/featuers/home/logic/next_pray.dart';
import 'package:muslim/app/featuers/prayer/data/models/pray_entity_model.dart';
import 'package:muslim/app/featuers/prayer/presentation/manger/prayer_details_cubit/prayer_details_cubit.dart';
import 'package:muslim/app/shared/custom_text.dart';



class NextPrayerCountdown extends StatefulWidget {
  const NextPrayerCountdown({
    super.key,
  });

  @override
  State<NextPrayerCountdown> createState() => _NextPrayerCountdownState();
}

class _NextPrayerCountdownState extends State<NextPrayerCountdown> {
  Timer? _timer;
  void _startTimer() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        setState(() {
         
        });
      },
    );
  }

  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrayerDetailsCubit, PrayerDetailsCubitState>(
      builder: (context, state) {
        if (state is PrayerDetailsCubitSuccess) {
          DateTime now = DateTime.now();
          NextPrayerInfo nextPrayerInfo = getNextPrayerInfo(state.prayers, now);

          PrayEntityModel nextPrayer = nextPrayerInfo.nextPrayer;
          String timeRemaining = nextPrayerInfo.timeRemaining;

          return Row(
            children: [
              CustomText(
                text: '${nextPrayer.name} will begin in ',
                color: Colors.white,
                fontSize: 16,
              ),
              ClipRRect(
                  borderRadius: BorderRadius.circular(4.0),
                  child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4.0),
                        decoration: BoxDecoration(
                          color: Colors.orange.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(4.0),
                          border: Border.all(
                            color: Colors.orange.withOpacity(0.3),
                            width: 1.0,
                          ),
                        ),
                        child: CustomText(
                          text: "-$timeRemaining",
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      )))
            ],
          );
        } else if (state is PrayerDetailsCubitLoading) {
          return const CustomText(
            text: 'Loading...',
            color: Colors.white,
            fontSize: 16,
          );
        } else {
          return const CustomText(
            text: 'Error loading time',
            color: Colors.white,
            fontSize: 16,
          );
        }
      },
    );
  }
}
