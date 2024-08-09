import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
import '../configs/configs.dart';

Future<void> appDialog(BuildContext context,
    {String? title ,
      required String msg,
      bool? isSuccess,
      List<Widget>? actions
    }) async {
  final alert = AlertDialog(
    backgroundColor: Colors.white,
    actionsAlignment: MainAxisAlignment.center,
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        HugeIcon(
          icon: isSuccess == true ? HugeIcons.strokeRoundedCheckmarkBadge01 : HugeIcons.strokeRoundedSadDizzy,
          color: AppColors.seed,
          size: 60.0.r,
        ),
        SizedBox(height: 15.h,),
        Text(
          title ?? (isSuccess == true? 'Success!' :
          'Failed!'),
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
            color: AppColors.seed
          ),
        ),
        SizedBox(height: 8.h,),
        Text(
          msg,
          textAlign: TextAlign.center,
        ),
      ],
    ),
    actions: actions ?? [
      SizedBox(
        width: double.maxFinite,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)
                )
            ),
            onPressed: (){
          Navigator.pop(context);
        }, child: const Text("Dismiss")),
      )
    ],
  );

  await showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
