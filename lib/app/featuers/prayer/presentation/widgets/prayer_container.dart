import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muslim/app/core/utils/app_color.dart';
import 'package:muslim/app/shared/custom_text.dart';

class PrayerContainer extends StatelessWidget {
  const PrayerContainer({
    super.key,
    required this.prayerName,
    required this.dir,
    required this.time,
    required this.image,
  });
  final String image;
  final String prayerName;
  final String dir;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25.h.w),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2,
      decoration: BoxDecoration(
        color: AppColor.colorr,
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.symmetric(
              horizontal: 30.w,
            ),
            margin: EdgeInsets.all(10.h.w),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 12,
            decoration: BoxDecoration(
              color: AppColor.colorOfItem,
              borderRadius: BorderRadius.circular(25.r),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 40.w,
                  height: 40.h,
                  child: image.isNotEmpty
                      ? Image.network(
                          image,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
                        )
                      : const Icon(Icons.image_not_supported),
                ),
                SizedBox(width: 10.w),
                // Use Expanded to constrain the Column's width
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: prayerName,
                        fontSize: 18,
                      ),
                      CustomText(
                        text: dir,
                        fontSize: 18,
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  width: 60.w,
                  child: CustomText(
                    text: time,
                    textAlign: TextAlign.end,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
