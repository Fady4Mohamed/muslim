import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muslim/app/core/utils/app_color.dart';
import 'package:muslim/app/featuers/prayer/presentation/manger/prayer_details_cubit/prayer_details_cubit.dart';
import 'package:muslim/app/shared/custom_text.dart';

class DateSelectorScreen extends StatefulWidget {
  const DateSelectorScreen({super.key});

  @override
  _DateSelectorScreenState createState() => _DateSelectorScreenState();
}

class _DateSelectorScreenState extends State<DateSelectorScreen> {
  DateTime selectedDate = DateTime.now();

  void changeDate(int days) {
    setState(() {
      selectedDate = selectedDate.add(Duration(days: days));
    });
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
      width: MediaQuery.of(context).size.width / 1.5,
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocListener<PrayerDetailsCubit, PrayerDetailsCubitState>(
            listener: (context, state) {
              setState(() {});
            },
            child: CustomText(
              text: BlocProvider.of<PrayerDetailsCubit>(context).prayerRepoImpl.date ?? "Loading",
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColor.black,
            ),
          ),
        ],
      ),
    );
  }
}
