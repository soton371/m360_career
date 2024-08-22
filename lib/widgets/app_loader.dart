import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../configs/configs.dart';

Future<void> appLoader(BuildContext context, {String? msg}) async {
  final alert = AlertDialog.adaptive(
    backgroundColor: Colors.white,
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 8,),
        const SpinKitCircle(
          color: AppColors.seed,
          size: 70.0,
        ),
        const SizedBox(height: 15,),
        Text(
          msg ?? 'Please waiting a moment, we are preparing for you..',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500
          ),
        ),
        const SizedBox(height: 8,),
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
