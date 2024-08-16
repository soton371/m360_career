import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:m360_career/configs/configs.dart';

class CustomToast extends StatelessWidget {
  final String message, title;

  const CustomToast({super.key, required this.message, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      margin: EdgeInsets.symmetric(horizontal: 30.w),
      decoration: BoxDecoration(
        color: AppColors.container,
        border: Border.all(color: AppColors.shadow),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          HugeIcon(
            icon: HugeIcons.strokeRoundedCheckmarkBadge01,
            color: AppColors.seed,
            size: 60.0.r,
          ),
          SizedBox(height: 15.h,),
          Text(title,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.seed
            ),
          ),
          SizedBox(height: 8.h,),
          Text(
            message,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

void appToast(BuildContext context, String message, String title) {
  OverlayEntry overlayEntry = OverlayEntry(
    builder: (context) => Center(
      child: Material(
        color: Colors.transparent,
        child: CustomToast(message: message, title: title,),
      ),
    ),
  );

  Overlay.of(context).insert(overlayEntry);

  // Remove the toast after some time
  Future.delayed(const Duration(seconds: 3), () {
    overlayEntry.remove();
  });
}
