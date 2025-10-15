import 'package:flutter/material.dart';
import 'dart:math' as math;

class PatternBackground extends StatelessWidget {
  const PatternBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _PatternPainter(),
      size: Size.infinite,
    );
  }
}

class _PatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = const Color(0xFFFED84C).withOpacity(0.20)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;

    // ✅ Center pattern around where the debit card is drawn
    // You said in the screenshot, it aligns roughly at the card’s center, below the logo.
    final Offset center = Offset(size.width / 2, size.height * 0.42);

    const int ringCount = 6;
    const double baseRadius = 120;

    for (int i = 0; i < ringCount; i++) {
      final Path path = Path();
      final double radius = baseRadius + (i * 22);

      for (double angle = 0; angle <= 2 * math.pi; angle += 0.04) {
        final distortion = math.sin(angle * 2 + i) * 2;
        final x = center.dx + (radius + distortion) * math.cos(angle);
        final y = center.dy + (radius + distortion) * math.sin(angle);
        if (angle == 0) {
          path.moveTo(x, y);
        } else {
          path.lineTo(x, y);
        }
      }
      canvas.drawPath(path, paint);
    }

    // Subtle gradient overlay for realism
    final Rect gradientRect = Rect.fromLTWH(0, 0, size.width, size.height);
    final Paint gradientPaint = Paint()
      ..shader = RadialGradient(
        colors: [
          Colors.transparent,
          Colors.black.withOpacity(0.55),
        ],
        radius: 1.1,
        center: Alignment.center,
      ).createShader(gradientRect);

    canvas.drawRect(gradientRect, gradientPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
