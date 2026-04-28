import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../models/project_model.dart';
import '../../utils/app_colors.dart';

class SocialButton extends StatelessWidget {
  final SocialLinkModel link;

  const SocialButton({super.key, required this.link});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () async {
        final Uri url = Uri.parse(link.url);
        if (!await launchUrl(url)) throw Exception('Could not Launch $url');
      },
      icon: Icon(link.icon, size: 18, color: AppColors.primaryBlue),
      label: Text(
        link.label,
        style: const TextStyle(color: AppColors.textWhite70),
      ),
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: AppColors.primaryBlue.withOpacity(0.5)),
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 18),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}