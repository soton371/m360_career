import 'package:flutter/material.dart';
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
          size: 60.0,
        ),
        const SizedBox(height: 15,),
        Text(
          title ?? (isSuccess == true? 'Success!' :
          'Sorry!'),
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            color: AppColors.seed
          ),
        ),
        const SizedBox(height: 8,),
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
