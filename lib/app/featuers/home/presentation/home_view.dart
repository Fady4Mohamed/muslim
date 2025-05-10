import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:muslim/app/featuers/azkar/ui/azkar_details_card.dart';
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
  String hijriDate = '20 Rabi\' al-Awal 1446';

  final prayerTimes = [
    {'name': 'Fajr', 'time': '4:49 AM', 'icon': Icons.nightlight_round},
    {'name': 'Dhuhr', 'time': '11:59 AM', 'icon': Icons.wb_sunny},
    {'name': 'Asr', 'time': '3:14 PM', 'icon': Icons.wb_twilight_outlined},
    {
      'name': 'Maghrib',
      'time': '5:58 PM',
      'icon': Icons.wb_twilight,
      'isNext': true
    },
    {'name': 'Isha', 'time': '8:07 AM', 'icon': Icons.sunny},
  ];

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        setState(() {
          if (nextPrayerDuration.inSeconds > 0) {
            nextPrayerDuration =
                Duration(seconds: nextPrayerDuration.inSeconds - 1);
          }
        });
      },
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$hours:$minutes:$seconds";
  }

  String _getCurrentTime() {
    return DateFormat('HH:mm').format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff000014),
      body: Stack(
        children: [
          // Background image
          Container(
            height: 550,
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
                ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      height: 330.h,
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: SafeArea(
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
                                        CustomText(
                                          text: hijriDate,
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ],
                                    ),
                                  ),

                                  const SizedBox(height: 12),

                                  // Next prayer countdown
                                  Row(
                                    children: [
                                      const CustomText(
                                        text: 'Maghrib will begin in ',
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                        child: BackdropFilter(
                                          filter: ImageFilter.blur(
                                              sigmaX: 10, sigmaY: 10),
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0, vertical: 4.0),
                                            decoration: BoxDecoration(
                                              color: Colors.orange
                                                  .withOpacity(0.3),
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                              border: Border.all(
                                                color: Colors.orange
                                                    .withOpacity(0.3),
                                                width: 1.0,
                                              ),
                                            ),
                                            child: CustomText(
                                              text:
                                                  "-${_formatDuration(nextPrayerDuration)}",
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 15),

                            // Prayer times row
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: BackdropFilter(
                                filter:
                                    ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                child: Container(
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
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: prayerTimes.map((prayer) {
                                      final bool isNext =
                                          prayer.containsKey('isNext');
                                      return Column(
                                        children: [
                                          Text(
                                            prayer['name'] as String,
                                            style: TextStyle(
                                              color: isNext
                                                  ? Colors.orange
                                                  : Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          const SizedBox(height: 12),
                                          Icon(
                                            prayer['icon'] as IconData,
                                            color: isNext
                                                ? Colors.orange
                                                : Colors.white,
                                            size: 28,
                                          ),
                                          const SizedBox(height: 12),
                                          Text(
                                            prayer['time'] as String,
                                            style: TextStyle(
                                              color: isNext
                                                  ? Colors.orange
                                                  : Colors.white,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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
