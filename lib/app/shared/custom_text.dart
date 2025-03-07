import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muslim/app/core/utils/app_color.dart';

class CustomText extends StatelessWidget {
  final String text;
  final String? fontFamily;
  final Color? color;
  final double fontSize;
  final FontWeight? fontWeight;
  final int? maxLines;
  final double? height;
  final TextAlign? textAlign;
  const CustomText({
    super.key,
    required this.text,
    this.color = AppColor.white,
    this.fontWeight = FontWeight.normal,
    required this.fontSize,
    this.fontFamily,
    this.textAlign,
    this.height,
    this.maxLines = 2,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.cairo(
        height: height ?? 1.4,
        fontSize: fontSize.sp,
        // fontFamily: fontFamily ?? AppFonts.regular,
        color: color,
        decorationStyle: TextDecorationStyle.solid,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
      maxLines: maxLines,
    );
  }
}
