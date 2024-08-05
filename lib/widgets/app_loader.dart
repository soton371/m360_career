import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../configs/configs.dart';

Future<void> appLoader(BuildContext context, {String? msg}) async {
  final alert = AlertDialog.adaptive(
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 8.h,),
        SpinKitCircle(
          color: AppColors.seed,
          size: 70.0.r,
        ),
        SizedBox(height: 15.h,),
        Text(
          msg ?? 'Please waiting a moment, we are preparing for you..',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w500
          ),
        ),
        SizedBox(height: 8.h,),
      ],
    ),
  );
  await showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
