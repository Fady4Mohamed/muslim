import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim/app/core/utils/app_color.dart';
import 'package:muslim/app/featuers/prayer/presentation/manger/prayer_details_cubit/prayer_details_cubit.dart';
import 'package:muslim/app/shared/custom_text.dart';

class HijriText extends StatefulWidget {
  const HijriText({super.key});

  @override
  State<HijriText> createState() => _HijriTextState();
}

class _HijriTextState extends State<HijriText> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<PrayerDetailsCubit, PrayerDetailsCubitState>(
      listener: (context, state) {
        if (state is PrayerDetailsCubitSuccess) {
          setState(() {});
        }
      },
      child: CustomText(
        text:
            BlocProvider.of<PrayerDetailsCubit>(context).prayerRepoImpl.hijri ??
                "loading",
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColor.white,
      ),
    );
  }
}
