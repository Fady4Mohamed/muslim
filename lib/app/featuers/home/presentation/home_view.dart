import 'dart:async';
import 'dart:developer';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
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

class _HomeViewState extends State<HomeView> {
  Timer? _timer;
  Duration nextPrayerDuration =
      const Duration(hours: 0, minutes: 37, seconds: 25);

  @override
  void initState() {
    super.initState();
    
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  

  String _getCurrentTime() {
    return DateFormat('HH:mm').format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    String hijriDate =
        BlocProvider.of<PrayerDetailsCubit>(context).prayerRepoImpl.date ??
            "Loading";
    return Scaffold(
      backgroundColor: const Color(0xff000014),
      body: Stack(
        children: [
          // Background image
          Container(
            height: 550.h,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/homeBack.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Make the entire content scrollable
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                // Top section with prayer times
                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Time and hijri date
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 12.0),
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
                                padding: const EdgeInsets.only(
                                    top: 12.0, bottom: 8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      text: _getCurrentTime(),
                                      color: Colors.white,
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    BlocListener<PrayerDetailsCubit,
                                        PrayerDetailsCubitState>(
                                      listener: (context, state) {
                                        if (hijriDate == "Loading") {
                                          if (state
                                              is PrayerDetailsCubitSuccess) {
                                            setState(() {
                                              hijriDate = BlocProvider.of<
                                                          PrayerDetailsCubit>(
                                                      context)
                                                  .prayerRepoImpl
                                                  .date!;
                                            });
                                          }
                                        }
                                      },
                                      child: CustomText(
                                        text: hijriDate,
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(height: 12),

                              // Next prayer countdown
                            const  NextPrayerCountdown(),
                            ],
                          ),
                        ),

                        const SizedBox(height: 15),

                        // Prayer times row
                        const PrayContainer(),
                      ],
                    ),
                  ),
                ),

                // Hadith/Azkar section - now part of the main scrollable area
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
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
                        // Remove the SingleChildScrollView since the entire screen is now scrollable
                        child: const AzkarDetailsCard(
                          isHome: true,
                          id: 1,
                        ),
                      ),
                    ),
                  ),
                ),
                // Add some padding at the bottom to ensure content is fully visible when scrolled
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
