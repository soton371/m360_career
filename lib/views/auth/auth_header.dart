import 'package:flutter/material.dart';
import '../../configs/configs.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key, required this.title, required this.subtitle});
  final String title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: AppSizes.titleLargeTextSize,
              fontWeight: FontWeight.bold,
              color: AppColors.title),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(subtitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 13
          ),
        ),
      ],
    );
  }
}
