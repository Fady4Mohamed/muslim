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
        designSize: _getDesignSize(context),
        builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: const TextScaler.linear(1.0)),
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
                  theme: ThemeData.dark()
                      .copyWith(scaffoldBackgroundColor: AppColor.mainColor),
                  routerConfig: AppRouter.router,
                ),
              ),
            )));
  }
}

Size _getDesignSize(BuildContext context) {
  final MediaQueryData mediaQuery = MediaQuery.of(context);
  final double shortestSide = mediaQuery.size.shortestSide;
  final double width = mediaQuery.size.width;
  final double height = mediaQuery.size.height;
  if (shortestSide < 600) {
    // Phone
    return const Size(414, 896); // iPhone design size
  } else if (shortestSide < 900) {
    // Tablet
    return const Size(768, 1024); // iPad design size
  } else {
    // Large tablet
    return Size(width, height);
  }
}
