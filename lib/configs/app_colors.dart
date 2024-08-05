import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:m360_career/configs/configs.dart';

class AppColors{
  static const Color seed = Color(0xfffc6d31);
  static const Color bg = Color(0xfffdfdfd);
  static const Color container = Color(0xffffffff);
  static const Color title = Color(0xff0d013f);
  static const Color shadow = Color(0xfff4f5f7);
  static const Color hint = Color(0xff9d96bd);
  static const Color filledButton = Color(0xfffbe9da);
  static const Color filledButtonText = Color(0xffea7c11);


  static List<BoxShadow> boxShadow = [
    BoxShadow(
        color: shadow,
        spreadRadius: 1.r,
        offset: Offset(0, 1.r),
        blurRadius: AppSizes.radius)
  ];
}