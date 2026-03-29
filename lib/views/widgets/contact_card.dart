import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/app_colors.dart';

class ContactCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String value;
  final VoidCallback? onTap;

  const ContactCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    this.onTap,
  });

  @override
  State<ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: 280,
          padding: const EdgeInsets.all(20),
          transform: isHovered
              ? Matrix4.translationValues(0, -15, 0)
              : Matrix4.translationValues(0, 0, 0),
          decoration: BoxDecoration(
            color: isHovered ? AppColors.cardHoverBg : AppColors.cardBg,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isHovered
                  ? AppColors.primaryBlue
                  : AppColors.primaryBlue.withValues(alpha: 0.1),
              width: isHovered ? 2 : 1,
            ),
            boxShadow: [
              if (isHovered)
                BoxShadow(
                  color: AppColors.primaryBlue.withValues(alpha: 0.3),
                  blurRadius: 25,
                  offset: const Offset(0, 15),
                ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(widget.icon, color: AppColors.primaryBlue, size: 30),
              const SizedBox(height: 15),
              Text(
                  widget.title,
                  style: const TextStyle(color: AppColors.textGrey, fontSize: 13)
              ),
              const SizedBox(height: 5),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  widget.value,
                  style: const TextStyle(
                    color: AppColors.textWhite,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}