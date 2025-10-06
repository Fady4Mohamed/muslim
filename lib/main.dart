import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muslim/app/core/api/api_service.dart';
import 'package:muslim/app/core/routing/app_router.dart';
import 'package:muslim/app/core/utils/app_color.dart';
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
          child: BlocProvider(
            create: (context) => PrayerDetailsCubit(
              PrayerRepoImpl(
                ApiServices(
                  Dio(),
                ),
              ),
            )..fetchPrayerDetails(),
            child: SafeArea(
              bottom: true,
              top: false,
              child: MaterialApp.router(
                debugShowCheckedModeBanner: false,
                theme: ThemeData.dark().copyWith(
                  scaffoldBackgroundColor: AppColor.mainColor,
                ),
                routerConfig: AppRouter.router,
              ),
            ),
          ),
        );
      },
    );
  }
}
