import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muslim/app/featuers/out/presentation/ui/outer_view.dart';

void main() {
  runApp(DevicePreview(
    builder: (context) => const Muslim(),
  ));
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
            child: const SafeArea(
              bottom: true,
              top: false,
              child: MaterialApp(
                home: OuterView(),
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
