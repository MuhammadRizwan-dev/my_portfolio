import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:my_portfolio/utils/app_colors.dart';

class ProjectCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final List<String> tags;
  final String projectUrl;

  const ProjectCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.tags,
    required this.projectUrl,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState(() => isHovered = true),
      onExit: (event) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 320,
        padding: const EdgeInsets.all(25),
        transform: isHovered
            ? Matrix4.translationValues(0, -15, 0)
            : Matrix4.translationValues(0, 0, 0),
        decoration: BoxDecoration(
          color: isHovered ? AppColors.cardHoverBg : AppColors.cardBg,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: isHovered
                ? AppColors.primaryBlue
                : AppColors.primaryBlue.withValues(alpha: 0.2),
          ),
          boxShadow: [
            BoxShadow(
              color: isHovered
                  ? AppColors.primaryBlue.withValues(alpha: 0.3)
                  : Colors.transparent,
              blurRadius: 25,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(widget.icon, color: AppColors.primaryBlue, size: 40),
            const SizedBox(height: 15),
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.textWhite,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.subtitle,
              style: const TextStyle(
                color: AppColors.textGrey,
                fontSize: 13,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 20),

            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: widget.tags
                  .map(
                    (tag) => Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primaryBlue.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: AppColors.primaryBlue.withValues(alpha: 0.3),
                    ),
                  ),
                  child: Text(
                    tag,
                    style: const TextStyle(
                      color: AppColors.primaryBlue,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
                  .toList(),
            ),
            const SizedBox(height: 25),
            GestureDetector(
              onTap: widget.projectUrl.isEmpty
                  ? null
                  : () async {
                final Uri url = Uri.parse(widget.projectUrl);
                if (!await launchUrl(url)) {
                  throw Exception('Could not launch $url');
                }
              },
              child: Row(
                children: [
                  Text(
                    widget.projectUrl.isEmpty ? "Private Project" : "View Project",
                    style: TextStyle(
                      color: widget.projectUrl.isEmpty
                          ? AppColors.textGrey
                          : (isHovered ? AppColors.primaryBlue : AppColors.textWhite70),
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Icon(
                    widget.projectUrl.isEmpty ? Icons.lock_outline : Icons.arrow_right_alt,
                    color: widget.projectUrl.isEmpty ? AppColors.textGrey : AppColors.primaryBlue,
                    size: 18,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}