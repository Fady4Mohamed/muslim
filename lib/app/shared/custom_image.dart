import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomImageAsset extends StatelessWidget {
  final String imagePath;
  final double? width;
  final double? height;
  final BoxFit fit;

  const CustomImageAsset({
    super.key,
    required this.imagePath,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    // Check the file extension
    String extension = imagePath.split('.').last.toLowerCase();

    // Wrap the image in a SizedBox with provided width and height
    return Center(
      child: SizedBox(
        width: width?.w,
        height: height?.h,
        child: extension == 'svg'
            ? SvgPicture.asset(
                imagePath,
                width: width?.w,
                height: height?.h,
                fit: fit,
              )
            : Image.asset(
                imagePath,
                width: width?.w,
                height: height?.h,
                fit: fit,
              ),
      ),
    );
  }
}
