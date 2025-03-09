import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim/app/core/utils/app_color.dart';
import 'package:muslim/app/core/utils/app_images.dart';
import 'package:muslim/app/featuers/qibla/logic/cubit/qiblah_cubit.dart';
import 'package:muslim/app/shared/custom_image.dart';
import 'package:muslim/app/shared/custom_text.dart';

class QiblahView extends StatelessWidget {
  const QiblahView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.mainColor,
        title:
            const Center(child: CustomText(text: "اتجاه القبلة", fontSize: 32)),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            const Positioned(
              left: 0,
              right: 0,
              bottom: 1,
              child: CustomImageAsset(
                height: 570,
                width: 570,
                imagePath: AppImages.imagesQiblaBackImg,
              ),
            ),
            Center(
              child: BlocBuilder<QiblahCubit, QiblahState>(
                builder: (context, state) {
                  if (state is QiblahLoading) {
                    return const CircularProgressIndicator();
                  } else if (state is QiblahLoaded) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Transform.rotate(
                          angle: -state.qiblahDirection * (pi / 180),
                          child: const CustomImageAsset(
                              width: 300,
                              height: 300,
                              imagePath: AppImages.imagesQibla),
                        ),
                        const SizedBox(height: 50),
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
