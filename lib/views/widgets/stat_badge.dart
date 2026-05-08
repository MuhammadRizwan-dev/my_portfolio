import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/app_colors.dart';

class StatBadge extends StatelessWidget {
  final String number;
  final String label;
  const StatBadge({super.key, required this.number, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          number,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryBlue,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 11,fontWeight: FontWeight.bold,
            color: AppColors.textGrey,
          ),
        ),
      ],
    );
  }
}