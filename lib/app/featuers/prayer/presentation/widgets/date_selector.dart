import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:muslim/app/core/utils/app_color.dart';
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
    final formattedDate = DateFormat('d MMMM yyyy').format(selectedDate);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
      width: MediaQuery.of(context).size.width / 1.5,
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: SvgPicture.asset('assets/images/chevron-left.svg', color: AppColor.black),
            onPressed: () => changeDate(-1),
          ),
          CustomText(
            text: formattedDate,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColor.black,
          ),
          IconButton(
            icon: SvgPicture.asset(
              'assets/images/chevron-right.svg',
              color: AppColor.black,
            ),
            onPressed: () => changeDate(1),
          ),
        ],
      ),
    );
  }
}
