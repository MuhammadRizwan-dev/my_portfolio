// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:my_portfolio/utils/app_colors.dart';
//
// import '../../models/project_model.dart';
// import 'gallery_helper.dart';
//
// class ProjectCard extends StatefulWidget {
//   final String title;
//   final String subtitle;
//   final IconData icon;
//   final List<String> tags;
//   final String projectUrl;
//   final List<String> images;
//   final String demoUrl;
//
//   const ProjectCard({
//     super.key,
//     required this.title,
//     required this.subtitle,
//     required this.icon,
//     required this.tags,
//     required this.projectUrl,
//     required this.images,
//      this.demoUrl ="",
//   });
//
//   @override
//   State<ProjectCard> createState() => _ProjectCardState();
// }
//
// class _ProjectCardState extends State<ProjectCard> {
//   bool isHovered = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         MouseRegion(
//           onEnter: (event) => setState(() => isHovered = true),
//           onExit: (event) => setState(() => isHovered = false),
//           child: AnimatedContainer(
//             duration: const Duration(milliseconds: 300),
//             width: 320,
//             padding: const EdgeInsets.all(25),
//             transform: isHovered
//                 ? Matrix4.translationValues(0, -15, 0)
//                 : Matrix4.translationValues(0, 0, 0),
//             decoration: BoxDecoration(
//               color: isHovered ? AppColors.cardHoverBg : AppColors.cardBg,
//               borderRadius: BorderRadius.circular(25),
//               border: Border.all(
//                 color: isHovered
//                     ? AppColors.primaryBlue
//                     : AppColors.primaryBlue.withValues(alpha: 0.2),
//               ),
//               boxShadow: [
//                 BoxShadow(
//                   color: isHovered
//                       ? AppColors.primaryBlue.withValues(alpha: 0.3)
//                       : Colors.transparent,
//                   blurRadius: 25,
//                   offset: const Offset(0, 10),
//                 ),
//               ],
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Icon(widget.icon, color: AppColors.primaryBlue, size: 40),
//                 const SizedBox(height: 15),
//                 Text(
//                   widget.title,
//                   style: const TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: AppColors.textWhite,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 Text(
//                   widget.subtitle,
//                   style: const TextStyle(
//                     color: AppColors.textGrey,
//                     fontSize: 13,
//                     height: 1.4,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//
//                 Wrap(
//                   spacing: 8,
//                   runSpacing: 8,
//                   children: widget.tags
//                       .map(
//                         (tag) => Container(
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 10,
//                             vertical: 5,
//                           ),
//                           decoration: BoxDecoration(
//                             color: AppColors.primaryBlue.withValues(alpha: 0.1),
//                             borderRadius: BorderRadius.circular(8),
//                             border: Border.all(
//                               color: AppColors.primaryBlue.withValues(
//                                 alpha: 0.3,
//                               ),
//                             ),
//                           ),
//                           child: Text(
//                             tag,
//                             style: const TextStyle(
//                               color: AppColors.primaryBlue,
//                               fontSize: 10,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       )
//                       .toList(),
//                 ),// Demo button
//                 const SizedBox(height: 10),
//                 if (widget.demoUrl.isNotEmpty) ...[
//                   GestureDetector(
//                     onTap: () async {
//                       final Uri url = Uri.parse(widget.demoUrl);
//                       if (!await launchUrl(url)) throw Exception('Could not launch $url');
//                     },
//                     child: Row(
//                       children: [
//                         const Icon(Icons.play_circle_outline, color: Colors.redAccent, size: 18),
//                         const SizedBox(width: 5),
//                         Text(
//                           "Watch Demo",
//                           style: TextStyle(
//                             color: isHovered ? Colors.redAccent : AppColors.textWhite70,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 14,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//                 const SizedBox(height: 25),
//                 GestureDetector(
//                   onTap: widget.projectUrl.isEmpty
//                       ? null
//                       : () async {
//                           final Uri url = Uri.parse(widget.projectUrl);
//                           if (!await launchUrl(url)) {
//                             throw Exception('Could not launch $url');
//                           }
//                         },
//                   child: Row(
//                     children: [
//                       Text(
//                         widget.projectUrl.isEmpty
//                             ? "Private Project"
//                             : "View Project",
//                         style: TextStyle(
//                           color: widget.projectUrl.isEmpty
//                               ? AppColors.textGrey
//                               : (isHovered
//                                     ? AppColors.primaryBlue
//                                     : AppColors.textWhite70),
//                           fontWeight: FontWeight.bold,
//                           fontSize: 14,
//                         ),
//                       ),
//                       const SizedBox(width: 5),
//                       Icon(
//                         widget.projectUrl.isEmpty
//                             ? Icons.lock_outline
//                             : Icons.arrow_right_alt,
//                         color: widget.projectUrl.isEmpty
//                             ? AppColors.textGrey
//                             : AppColors.primaryBlue,
//                         size: 18,
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         if (widget.images.isNotEmpty)
//           Positioned(
//             top: 12,
//             right: 12,
//             child: Tooltip(
//               message: "View Screenshots",
//               child: GestureDetector(
//                 onTap: () => showProjectGallery(
//                   context,
//                   ProjectModel(
//                     title: widget.title,
//                     subtitle: widget.subtitle,
//                     icon: widget.icon,
//                     tags: widget.tags,
//                     projectUrl: widget.projectUrl,
//                     images: widget.images,
//                   ),
//                 ),
//                 child: AnimatedOpacity(
//                   opacity: isHovered ? 1.0 : 0.5,
//                   duration: const Duration(milliseconds: 250),
//                   child: Container(
//                     width: 36,
//                     height: 36,
//                     decoration: BoxDecoration(
//                       color: AppColors.primaryBlue.withValues(alpha: 0.15),
//                       borderRadius: BorderRadius.circular(10),
//                       border: Border.all(
//                         color: AppColors.primaryBlue.withValues(alpha: 0.4),
//                       ),
//                     ),
//                     child: const Icon(
//                       Icons.photo_library_outlined,
//                       color: AppColors.primaryBlue,
//                       size: 18,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//       ],
//     );
//   }
// }
// ... imports ...

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../models/project_model.dart';
import '../../utils/app_colors.dart';
import 'gallery_helper.dart';

class ProjectCard extends StatefulWidget {
  final ProjectModel project; // Direct model use karein

  const ProjectCard({
    super.key,
    required this.project,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MouseRegion(
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
                Icon(widget.project.icon, color: AppColors.primaryBlue, size: 40),
                const SizedBox(height: 15),
                Text(
                  widget.project.title,
                  maxLines: 1, // Title ko 1 line tak limit karein
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textWhite,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.project.subtitle,
                  maxLines: 3, // Subtitle ko max 3 lines den
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.textGrey,
                    fontSize: 13,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 20),

                // TAGS
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: widget.project.tags
                      .map((tag) => _buildTag(tag))
                      .toList(),
                ),

                const SizedBox(height: 20),

                // 1. WATCH DEMO (FittedBox added to prevent overflow)
                if (widget.project.demoUrl.isNotEmpty) ...[
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: GestureDetector(
                      onTap: () => _launchUrl(widget.project.demoUrl),
                      child: Row(
                        children: [
                          const Icon(Icons.play_circle_outline, color: Colors.redAccent, size: 18),
                          const SizedBox(width: 5),
                          Text(
                            "Watch Demo",
                            style: TextStyle(
                              color: isHovered ? Colors.redAccent : AppColors.textWhite70,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                ],

                // 2. DOWNLOAD APK + QR (only shown when apkUrl is set)
                if (widget.project.apkUrl.isNotEmpty) ...[
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => _launchUrl(widget.project.apkUrl),
                          child: Row(
                            children: [
                              const Icon(Icons.android_rounded, color: Colors.greenAccent, size: 18),
                              const SizedBox(width: 5),
                              Text(
                                "Download APK",
                                style: TextStyle(
                                  color: isHovered ? Colors.greenAccent : AppColors.textWhite70,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        InkWell(
                          borderRadius: BorderRadius.circular(8),
                          onTap: () => _showQrDialog(context, widget.project),
                          child: const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Icon(Icons.qr_code_2_rounded, color: AppColors.accentCyan, size: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                ],

                // 2b. OPEN WEB APP (for web-based/private projects, shown when webUrl is set)
                if (widget.project.webUrl.isNotEmpty) ...[
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: GestureDetector(
                      onTap: () => _launchUrl(widget.project.webUrl),
                      child: Row(
                        children: [
                          const Icon(Icons.open_in_new_rounded, color: Colors.orangeAccent, size: 18),
                          const SizedBox(width: 5),
                          Text(
                            "Open Web App",
                            style: TextStyle(
                              color: isHovered ? Colors.orangeAccent : AppColors.textWhite70,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                ],

                // 3. VIEW PROJECT (FittedBox added here too)
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: GestureDetector(
                    onTap: widget.project.projectUrl.isEmpty
                        ? null
                        : () => _launchUrl(widget.project.projectUrl),
                    child: Row(
                      children: [
                        Text(
                          widget.project.projectUrl.isEmpty ? "Private Project" : "View Project",
                          style: TextStyle(
                            color: widget.project.projectUrl.isEmpty
                                ? AppColors.textGrey
                                : (isHovered ? AppColors.primaryBlue : AppColors.textWhite70),
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Icon(
                          widget.project.projectUrl.isEmpty ? Icons.lock_outline : Icons.arrow_right_alt,
                          color: widget.project.projectUrl.isEmpty ? AppColors.textGrey : AppColors.primaryBlue,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // GALLERY ICON
        if (widget.project.images.isNotEmpty)
          Positioned(
            top: 12,
            right: 12,
            child: Tooltip(
              message: "View Screenshots",
              child: InkWell( // GestureDetector se behtar hai for feedback
                onTap: () => showProjectGallery(context, widget.project),
                child: AnimatedOpacity(
                  opacity: isHovered ? 1.0 : 0.6,
                  duration: const Duration(milliseconds: 250),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.primaryBlue.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.primaryBlue.withValues(alpha: 0.3)),
                    ),
                    child: const Icon(Icons.photo_library_outlined, color: AppColors.primaryBlue, size: 18),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  // Helper Methods for clean code
  Widget _buildTag(String tag) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.primaryBlue.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.primaryBlue.withValues(alpha: 0.3)),
      ),
      child: Text(tag, style: const TextStyle(color: AppColors.primaryBlue, fontSize: 10, fontWeight: FontWeight.bold)),
    );
  }

  Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url)) throw Exception('Could not launch $url');
  }

  void _showQrDialog(BuildContext context, ProjectModel project) {
    showDialog(
      context: context,
      builder: (ctx) => Dialog(
        backgroundColor: AppColors.cardBg,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                project.title,
                style: const TextStyle(color: AppColors.textWhite, fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 6),
              const Text(
                "Scan to install on your phone",
                style: TextStyle(color: AppColors.textGrey, fontSize: 12),
              ),
              const SizedBox(height: 18),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
                child: QrImageView(
                  data: project.apkUrl,
                  version: QrVersions.auto,
                  size: 200,
                  gapless: false,
                ),
              ),
              const SizedBox(height: 18),
              TextButton(
                onPressed: () => Navigator.pop(ctx),
                child: const Text("Close", style: TextStyle(color: AppColors.accentCyan)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}