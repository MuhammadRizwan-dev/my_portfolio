import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:async';
import 'dart:math' as math;
import 'package:my_portfolio/utils/app_colors.dart';

class RobotBuddy extends StatefulWidget {
  final double size;
  const RobotBuddy({super.key, this.size = 180});

  @override
  State<RobotBuddy> createState() => _RobotBuddyState();
}

class _RobotBuddyState extends State<RobotBuddy> with TickerProviderStateMixin {
  late AnimationController _hoverController;
  late Animation<double> _hoverAnimation;
  late AnimationController _glowController;
  late Animation<double> _glowAnimation;

  double _lookAngle = 0.0;
  bool _isBlinking = false;
  Timer? _blinkTimer;

  @override
  void initState() {
    super.initState();

    _hoverController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat(reverse: true);

    _hoverAnimation = Tween<double>(begin: -15, end: 15).animate(
      CurvedAnimation(parent: _hoverController, curve: Curves.easeInOut),
    );

    _glowController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);

    _glowAnimation = Tween<double>(begin: 0.1, end: 0.4).animate(
      CurvedAnimation(parent: _glowController, curve: Curves.easeInOut),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      GestureBinding.instance.pointerRouter.addGlobalRoute(_handleGlobalPointerEvent);
    });

    _startBlinking();
  }

  void _startBlinking() {
    _blinkTimer = Timer.periodic(const Duration(seconds: 2), (timer) async {
      if (!mounted) return;
      setState(() => _isBlinking = true);
      await Future.delayed(const Duration(milliseconds: 150));
      if (mounted) {
        setState(() => _isBlinking = false);
      }
    });
  }

  void _handleGlobalPointerEvent(PointerEvent event) {
    if (event is PointerHoverEvent || event is PointerMoveEvent) {
      if (!mounted) return;
      final RenderBox? renderBox = context.findRenderObject() as RenderBox?;
      if (renderBox != null) {
        final robotCenterGlobal = renderBox.localToGlobal(Offset(widget.size / 2, widget.size / 2));
        final vectorFromCenter = event.position - robotCenterGlobal;
        setState(() {
          _lookAngle = math.atan2(vectorFromCenter.dy, vectorFromCenter.dx);
        });
      }
    }
  }

  @override
  void dispose() {
    GestureBinding.instance.pointerRouter.removeGlobalRoute(_handleGlobalPointerEvent);
    _blinkTimer?.cancel();
    _hoverController.dispose();
    _glowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([_hoverAnimation, _glowAnimation]),
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _hoverAnimation.value),
          child: SizedBox(
            width: widget.size,
            height: widget.size,
            child: CustomPaint(
              painter: RobotPainter(
                glowIntensity: _glowAnimation.value,
                lookAngle: _lookAngle,
                isBlinking: _isBlinking,
              ),
            ),
          ),
        );
      },
    );
  }
}

class RobotPainter extends CustomPainter {
  final double glowIntensity;
  final double lookAngle;
  final bool isBlinking;

  RobotPainter({
    required this.glowIntensity,
    required this.lookAngle,
    required this.isBlinking,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    final primaryColor = AppColors.primaryBlue;
    final secondaryColor = AppColors.accentCyan;

    final bodyPaint = Paint()
      ..color = primaryColor.withValues(alpha: 0.1)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, size.width * 0.45, bodyPaint);

    final bodyBorderPaint = Paint()
      ..color = primaryColor.withValues(alpha: 0.7)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    canvas.drawCircle(center, size.width * 0.45, bodyBorderPaint);

    final eyeRadius = size.width * 0.28;
    final lookX = center.dx + (eyeRadius * 0.35 * math.cos(lookAngle));
    final lookY = center.dy + (eyeRadius * 0.35 * math.sin(lookAngle));
    final currentLookCenter = Offset(lookX, lookY);

    if (isBlinking) {
      final blinkPaint = Paint()
        ..color = secondaryColor
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..strokeWidth = 6;

      canvas.drawLine(
          Offset(currentLookCenter.dx - 18, currentLookCenter.dy),
          Offset(currentLookCenter.dx + 18, currentLookCenter.dy),
          blinkPaint
      );
    } else {
      final coreGlowPaint = Paint()
        ..color = secondaryColor.withValues(alpha: 0.3 + glowIntensity)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 12);
      canvas.drawCircle(center, eyeRadius * 0.8, coreGlowPaint);

      final innerCorePaint = Paint()
        ..shader = RadialGradient(
          colors: [AppColors.textWhite, secondaryColor],
        ).createShader(Rect.fromCircle(center: currentLookCenter, radius: eyeRadius * 0.5))
        ..style = PaintingStyle.fill;
      canvas.drawCircle(currentLookCenter, eyeRadius * 0.5, innerCorePaint);

      final pupilPaint = Paint()
        ..color = AppColors.textWhite
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4);
      canvas.drawCircle(currentLookCenter, eyeRadius * 0.15, pupilPaint);
    }

    final antennaPath = Path();
    antennaPath.moveTo(center.dx - size.width * 0.38, center.dy - size.width * 0.2);
    antennaPath.lineTo(center.dx - size.width * 0.55, center.dy - size.width * 0.45);
    antennaPath.lineTo(center.dx - size.width * 0.45, center.dy - size.width * 0.25);
    canvas.drawPath(antennaPath, bodyBorderPaint);

    canvas.save();
    canvas.translate(size.width, 0);
    canvas.scale(-1, 1);
    canvas.drawPath(antennaPath, bodyBorderPaint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(RobotPainter oldDelegate) {
    return oldDelegate.lookAngle != lookAngle ||
        oldDelegate.glowIntensity != glowIntensity ||
        oldDelegate.isBlinking != isBlinking;
  }
}