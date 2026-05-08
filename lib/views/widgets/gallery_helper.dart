import 'dart:ui';
import 'package:flutter/material.dart';
import '../../models/project_model.dart';
import 'package:my_portfolio/utils/app_colors.dart';

void showProjectGallery(BuildContext context, ProjectModel project) {
  if (project.images.isEmpty) return;

  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: project.title,
    barrierColor: Colors.black.withValues(alpha: 0.85),
    transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (context, anim1, anim2) {
      return _GalleryDialog(project: project);
    },
  );
}

class _GalleryDialog extends StatefulWidget {
  final ProjectModel project;
  const _GalleryDialog({required this.project});

  @override
  State<_GalleryDialog> createState() => _GalleryDialogState();
}

class _GalleryDialogState extends State<_GalleryDialog> {
  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      precacheImage(AssetImage(widget.project.images[0]), context);
      if (widget.project.images.length > 1) {
        precacheImage(AssetImage(widget.project.images[1]), context);
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final total = widget.project.images.length;

    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [

            // ── Images PageView ──
            Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.75,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: total,
                  // ✅ Scroll karo toh next image preload ho
                  onPageChanged: (i) {
                    setState(() => _currentIndex = i);
                    final next = i + 1;
                    if (next < widget.project.images.length) {
                      precacheImage(AssetImage(widget.project.images[next]), context);
                    }
                  },
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: InteractiveViewer(
                        child: Image.asset(
                          widget.project.images[index],
                          fit: BoxFit.contain,
                          cacheWidth: 800, // ✅ Memory mein compressed
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            // ── Left Arrow ──
            if (_currentIndex > 0)
              Positioned(
                left: 10,
                top: 0, bottom: 0,
                child: Center(
                  child: IconButton(
                    onPressed: () => _pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    ),
                    icon: const Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                ),
              ),

            // ── Right Arrow ──
            if (_currentIndex < total - 1)
              Positioned(
                right: 10,
                top: 0, bottom: 0,
                child: Center(
                  child: IconButton(
                    onPressed: () => _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    ),
                    icon: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                ),
              ),

            // ── Top Bar: Title + Counter + Close ──
            Positioned(
              top: 30, left: 20, right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.project.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${_currentIndex + 1} / $total',
                        style: const TextStyle(
                          color: Colors.white60,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.close_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),

            // ── Bottom Dots Indicator ──
            Positioned(
              bottom: 30, left: 0, right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(total, (i) {
                  final isActive = i == _currentIndex;
                  return GestureDetector(
                    onTap: () => _pageController.animateToPage(
                      i,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    ),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: isActive ? 24 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: isActive
                            ? AppColors.primaryBlue
                            : Colors.white38,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  );
                }),
              ),
            ),

          ],
        ),
      ),
    );
  }
}