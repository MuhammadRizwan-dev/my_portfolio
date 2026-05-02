import 'dart:ui';
import 'package:flutter/material.dart';
import '../../models/project_model.dart';

void showProjectGallery(BuildContext context, ProjectModel project) {
  // Agar images ki list empty ho to function wahin ruk jaye
  if (project.images.isEmpty) return;

  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: project.title,
    barrierColor: Colors.black.withValues(alpha: 0.85),
    transitionDuration: const Duration(milliseconds: 400),
    pageBuilder: (context, anim1, anim2) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              // 1. Close Button
              Positioned(
                top: 30, right: 30,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close_rounded, color: Colors.white, size: 35),
                ),
              ),
              // 2. The Interactive Slider
              Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: PageView.builder(
                    itemCount: project.images.length,
                    itemBuilder: (context, index) {
                      return InteractiveViewer( // Zoom support ke liye
                        child: Image.asset(
                          project.images[index],
                          fit: BoxFit.contain,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}