
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../configs/configs.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({super.key,
    this.obscureText,
    this.keyboardType,
    required this.label, required this.hintText, required this.textEditingController,
    this.suffixIcon
  });
  final String label, hintText;
  final TextEditingController textEditingController;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,style: TextStyle(
          color: AppColors.title,
          fontWeight: FontWeight.w600,
          fontSize: 13.sp
        ),),
        SizedBox(height: 5.h,),
        Container(
          decoration: BoxDecoration(
              boxShadow: AppColors.boxShadow
          ),
          child: TextFormField(
            controller: textEditingController,
            keyboardType: keyboardType,
            textCapitalization: TextCapitalization.sentences,
            obscureText: obscureText ?? false,
            decoration: InputDecoration(
              suffixIcon: suffixIcon,
              hintText: hintText,
              isDense: true,
              filled: true,
              fillColor: AppColors.container,
              hintStyle: TextStyle(fontWeight: FontWeight.normal,color: AppColors.hint, fontSize: 15.sp),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.radius),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.radius),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.radius),
                borderSide: BorderSide.none,
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.radius),
                borderSide: BorderSide.none,
              ),
            ),
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
          ),
        ),
        SizedBox(
          height: AppSizes.bodyPadding.h,
        ),
      ],
    );
  }
}
