import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';
import 'package:muslim/app/featuers/home/logic/next_pray.dart';
import 'package:muslim/app/featuers/prayer/data/models/pray_entity_model.dart';
import 'package:muslim/app/featuers/prayer/presentation/manger/prayer_details_cubit/prayer_details_cubit.dart';
import 'package:muslim/app/shared/custom_text.dart';

class NextPrayerCountdown extends StatefulWidget {
  const NextPrayerCountdown({super.key});

  @override
  State<NextPrayerCountdown> createState() => _NextPrayerCountdownState();
}

class _NextPrayerCountdownState extends State<NextPrayerCountdown> {
  Timer? _countdownTimer;
  String _timeRemaining = '';
  PrayEntityModel? _nextPrayer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _countdownTimer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    // Update every second for countdown
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        _updateCountdown();
      }
    });
    // Initial update
    _updateCountdown();
  }

  void _updateCountdown() {
    final cubit = context.read<PrayerDetailsCubit>();
    if (cubit.state is PrayerDetailsCubitSuccess) {
      final state = cubit.state as PrayerDetailsCubitSuccess;
      final nextPrayerInfo = getNextPrayerInfo(state.prayers);

      // Only update if values have changed to avoid unnecessary rebuilds
      if (_nextPrayer?.name != nextPrayerInfo.nextPrayer.name ||
          _timeRemaining != nextPrayerInfo.timeRemaining) {
        setState(() {
          _nextPrayer = nextPrayerInfo.nextPrayer;
          _timeRemaining = nextPrayerInfo.timeRemaining;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PrayerDetailsCubit, PrayerDetailsCubitState>(
      listener: (context, state) {
        if (state is PrayerDetailsCubitSuccess) {
          // Restart timer when new prayer data is loaded
          _countdownTimer?.cancel();
          _startTimer();
        }
      },
      child: BlocBuilder<PrayerDetailsCubit, PrayerDetailsCubitState>(
        buildWhen: (previous, current) {
          // Only rebuild when the state type changes, not on every timer update
          return previous.runtimeType != current.runtimeType;
        },
        builder: (context, state) {
          if (state is PrayerDetailsCubitSuccess) {
            if (_nextPrayer == null) {
              // Initial load
              final nextPrayerInfo = getNextPrayerInfo(state.prayers);
              _nextPrayer = nextPrayerInfo.nextPrayer;
              _timeRemaining = nextPrayerInfo.timeRemaining;
            }

            return _CountdownDisplay(
              nextPrayerName: _nextPrayer?.name ?? '',
              timeRemaining: _timeRemaining,
            );
          } else if (state is PrayerDetailsCubitLoading) {
            return const _LoadingDisplay();
          } else {
            return const _ErrorDisplay();
          }
        },
      ),
    );
  }
}

// Separate widget for countdown display to minimize rebuilds
class _CountdownDisplay extends StatelessWidget {
  final String nextPrayerName;
  final String timeRemaining;

  const _CountdownDisplay({
    required this.nextPrayerName,
    required this.timeRemaining,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomText(
          text: '$nextPrayerName will begin in ',
          color: Colors.white,
          fontSize: 16,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(4.0),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            decoration: BoxDecoration(
              color: Colors.orange.withOpacity(0.3),
              borderRadius: BorderRadius.circular(4.0),
              border: Border.all(
                color: Colors.orange.withOpacity(0.3),
                width: 1.0,
              ),
            ),
            child: CustomText(
              text: timeRemaining,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}

class _LoadingDisplay extends StatelessWidget {
  const _LoadingDisplay();

  @override
  Widget build(BuildContext context) {
    return const CustomText(
      text: 'Loading...',
      color: Colors.white,
      fontSize: 16,
    );
  }
}

class _ErrorDisplay extends StatelessWidget {
  const _ErrorDisplay();

  @override
  Widget build(BuildContext context) {
    return const CustomText(
      text: 'Error loading time',
      color: Colors.white,
      fontSize: 16,
    );
  }
}
