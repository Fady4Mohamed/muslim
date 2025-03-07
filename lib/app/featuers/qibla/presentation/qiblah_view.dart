import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim/app/core/utils/app_color.dart';
import 'package:muslim/app/core/utils/app_images.dart';
import 'package:muslim/app/featuers/qibla/logic/cubit/qiblah_cubit.dart';
import 'package:muslim/app/shared/custom_image.dart';
import 'package:muslim/app/shared/custom_text.dart';

class QiblahView extends StatefulWidget {
  const QiblahView({super.key});

  @override
  QiblahViewState createState() => QiblahViewState();
}

class QiblahViewState extends State<QiblahView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<QiblahCubit>().getQiblaDirection();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.mainColor,
        title: const Padding(
          padding: EdgeInsets.only(left: 12.0),
          child: Center(child: CustomText(text: "اتجاه القبلة", fontSize: 32)),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            const CustomImageAsset(imagePath: AppImages.imagesQiblaBackImg),
            Center(
              child: BlocBuilder<QiblahCubit, QiblahState>(
                builder: (context, state) {
                  if (state is QiblahLoading) {
                    return const CircularProgressIndicator();
                  } else if (state is QiblahLoaded) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 150),
                        Transform.rotate(
                          angle: state.qiblahDirection * (pi / 180),
                          child: const CustomImageAsset(
                              imagePath: AppImages.imagesQibla),
                        ),
                      ],
                    );
                  } else if (state is QiblahError) {
                    return Text("Error: ${state.message}");
                  }
                  return const CircularProgressIndicator();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
