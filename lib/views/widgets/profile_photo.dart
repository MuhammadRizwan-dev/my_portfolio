import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/app_colors.dart';

class ProfilePhoto extends StatelessWidget {
  final double size;
  const ProfilePhoto({super.key, this.size = 200});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size + 16,
      height: size + 16,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          colors: [AppColors.primaryBlue, Color(0xFF00C6FF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryBlue.withValues(alpha: 0.4),
            blurRadius: 30,
            spreadRadius: 5,
          ),
        ],
      ),
      padding: const EdgeInsets.all(4),
      child: ClipOval(
        child: Image.asset(
          'assets/images/my_pic.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}