import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muslim/app/core/api/api_service.dart';
import 'package:muslim/app/core/routing/app_router.dart';
import 'package:muslim/app/core/utils/app_color.dart';
import 'package:muslim/app/featuers/notification/data/repositories/notification_repo_impl.dart';
import 'package:muslim/app/featuers/notification/presentation/cubit/notification_cubit.dart';
import 'package:muslim/app/featuers/prayer/data/repos/prayer_repo_impl.dart';
import 'package:muslim/app/featuers/prayer/presentation/manger/prayer_details_cubit/prayer_details_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const Muslim(),
  );
}

class Muslim extends StatelessWidget {
  const Muslim({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      enableScaleText: () => true,
      designSize: const Size(414, 896), // Set default design size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: const TextScaler.linear(1.0),
          ),
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => PrayerDetailsCubit(
                  PrayerRepoImpl(
                    ApiServices(
                      Dio(),
                    ),
                  ),
                )..fetchPrayerDetails(),
              ),
              BlocProvider(
                create: (context) => NotificationCubit(
                  NotificationRepoImpl(),
                )..initializeNotifications(),
              ),
            ],
            child: SafeArea(
              bottom: true,
              top: false,
              child: BlocListener<PrayerDetailsCubit, PrayerDetailsCubitState>(
                listener: (context, state) {
                  if (state is PrayerDetailsCubitSuccess) {
                    for (var prayer in state.prayers) {
                      log('Scheduling notification for ${prayer.name} at ${prayer.time}');
                      DateTime? dateTime =
                          DateTime.tryParse("2025-12-12T10:30:00");
                      if (dateTime != null) {
                        context.read<NotificationCubit>().scheduleNotification(
                            id: state.prayers.indexOf(prayer),
                            title: 'حان موعد آذان صلاة ${prayer.name}',
                            scheduledTime: dateTime);
                      }
                    }
                  }
                },
                child: MaterialApp.router(
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData.dark().copyWith(
                    scaffoldBackgroundColor: AppColor.mainColor,
                  ),
                  routerConfig: AppRouter.router,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
