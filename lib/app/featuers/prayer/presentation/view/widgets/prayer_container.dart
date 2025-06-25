import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      decoration: const BoxDecoration(
        color: AppColor.colorr,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: BlocBuilder<PrayerDetailsCubit, PrayerDetailsCubitState>(
        builder: (context, state) {
          if (state is PrayerDetailsCubitSuccess) {
            return ListView.builder(
              
              padding: const EdgeInsets.symmetric(vertical: 10),
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
            return const Center(
                child: CircularProgressIndicator(
              color: AppColor.secondaryColor,
            ));
          }
        },
      ),
    );
  }
}
