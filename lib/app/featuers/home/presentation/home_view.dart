import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';
import 'package:muslim/app/featuers/azkar/ui/azkar_details_card.dart';
import 'package:muslim/app/featuers/home/presentation/widgets/next_prayer_countdown.dart';
import 'package:muslim/app/featuers/home/presentation/widgets/pray_container.dart';
import 'package:muslim/app/featuers/prayer/presentation/manger/prayer_details_cubit/prayer_details_cubit.dart';
import 'package:muslim/app/shared/custom_text.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with AutomaticKeepAliveClientMixin {
  Timer? _clockTimer;
  String _currentTime = '';

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _currentTime = _getCurrentTime();
    _startClockTimer();
  }

  @override
  void dispose() {
    _clockTimer?.cancel();
    super.dispose();
  }

  void _startClockTimer() {
    _clockTimer = Timer.periodic(const Duration(minutes: 1), (timer) {
      if (mounted) {
        final newTime = _getCurrentTime();
        if (newTime != _currentTime) {
          setState(() {
            _currentTime = newTime;
          });
        }
      }
    });
  }

  String _getCurrentTime() {
    return DateFormat('HH:mm').format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      backgroundColor: const Color(0xff000014),
      body: Stack(
        children: [
          // Background image
          const _BackgroundImage(),

          // Scrollable content
          SingleChildScrollView(
            physics: const MinimalBouncingScrollPhysics(),
            child: Column(
              children: [
                // Top section with time and prayer times
                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Time and date container
                        _TimeAndDateContainer(currentTime: _currentTime),

                        const SizedBox(height: 15),

                        // Prayer times row
                        const PrayContainer(),
                      ],
                    ),
                  ),
                ),

                // Hadith/Azkar section
                const _AzkarSection(),

                // Add some padding at the bottom
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Separate widget for background to avoid rebuilds
class _BackgroundImage extends StatelessWidget {
  const _BackgroundImage();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550.h,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/homeBack.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

// Separate widget for time and date section
class _TimeAndDateContainer extends StatelessWidget {
  final String currentTime;

  const _TimeAndDateContainer({required this.currentTime});

  @override
  Widget build(BuildContext context) {
    return LiquidGlass(
      glassContainsChild: false,
      settings: const LiquidGlassSettings(
        blur: 3,
        refractiveIndex: 1.5,
        ambientStrength: 2,
        chromaticAberration: 5,
      ),
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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12.0, bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: currentTime,
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                  BlocSelector<PrayerDetailsCubit, PrayerDetailsCubitState,
                      String>(
                    selector: (state) {
                      if (state is PrayerDetailsCubitSuccess) {
                        return context
                                .read<PrayerDetailsCubit>()
                                .prayerRepoImpl
                                .date ??
                            "Loading";
                      }
                      return "Loading";
                    },
                    builder: (context, hijriDate) {
                      return CustomText(
                        text: hijriDate,
                        color: Colors.white,
                        fontSize: 16,
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            // Next prayer countdown
            const NextPrayerCountdown(),
          ],
        ),
      ),
    );
  }
}

// Separate widget for Azkar section
class _AzkarSection extends StatelessWidget {
  const _AzkarSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.purple.withOpacity(0.7),
                Colors.deepPurple.withOpacity(0.8),
              ],
            ),
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
            border: Border.all(
              color: Colors.white.withOpacity(0.2),
              width: 1,
            ),
          ),
          child: const AzkarDetailsCard(
            isHome: true,
            id: 1,
          ),
        ),
      ),
    );
  }
}

class MinimalBouncingScrollPhysics extends BouncingScrollPhysics {
  const MinimalBouncingScrollPhysics({
    super.parent,
    this.customSpring = const SpringDescription(
      mass: 1.0,
      stiffness: 1000.0,
      damping: 50.0,
    ),
  });

  final SpringDescription customSpring;

  @override
  MinimalBouncingScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return MinimalBouncingScrollPhysics(
      parent: buildParent(ancestor),
      customSpring: customSpring,
    );
  }

  @override
  SpringDescription get spring => customSpring;

  @override
  double applyBoundaryConditions(ScrollMetrics position, double value) {
    final double overscroll = super.applyBoundaryConditions(position, value);

    return overscroll.clamp(-5.0, 5.0);
  }
}
