import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muslim/app/core/utils/app_color.dart';
import 'package:muslim/app/featuers/prayer/presentation/manger/prayer_details_cubit/prayer_details_cubit.dart';
import 'package:muslim/app/featuers/prayer/presentation/view/widgets/prayer_item.dart';

class PrayerContainer extends StatelessWidget {
  const PrayerContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25.h.w),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 1.5,
      decoration: BoxDecoration(
        color: AppColor.colorr,
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: BlocBuilder<PrayerDetailsCubit, PrayerDetailsCubitState>(
        builder: (context, state) {
          if (state is PrayerDetailsCubitSuccess) {
            return ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: state.prayers.length,
              itemBuilder: (context, index) {
                return PrayerItem(
                  image: state.prayers[index].image,
                  prayerName: state.prayers[index].name,
                  time: state.prayers[index].time,
                  dir: state.prayers[index].sun,
                );
              },
            );
          } else if (state is PrayerDetailsCubitFauilre) {
            return Text("Error: ${state.errMessage}");
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
