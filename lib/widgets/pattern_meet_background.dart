import 'package:flutter/material.dart';

class PatternMeetBackground extends StatelessWidget {
  const PatternMeetBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF000000), // solid black base
            Color(0xFF0A0A0A), // subtle fade to dark grey
          ],
        ),
      ),
      child: CustomPaint(
        size: MediaQuery.of(context).size,
        painter: _MeetPatternPainter(),
      ),
    );
  }
}

class _MeetPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double centerX = size.width * 0.5;
    final double baseY = size.height * 0.3;

    // Paint for main golden lines
    final paint = Paint()
      ..color = const Color(0xFFFED84C).withOpacity(0.18)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.3;

    // Paint for softer secondary glow lines
    final softPaint = Paint()
      ..color = const Color(0xFFFED84C).withOpacity(0.10)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    // First layer of large smooth curves
    for (int i = 0; i < 8; i++) {
      final path = Path();
      final offset = i * 40.0;
      path.moveTo(0, baseY + offset);
      path.cubicTo(
        size.width * 0.3, baseY + offset - 60,
        size.width * 0.7, baseY + offset + 100,
        size.width, baseY + offset + 20,
      );
      canvas.drawPath(path, paint);
    }

    // Second layer for depth
    for (int i = 0; i < 8; i++) {
      final path = Path();
      final offset = i * 40.0 + 20;
      path.moveTo(0, baseY + offset);
      path.cubicTo(
        size.width * 0.25, baseY + offset - 40,
        size.width * 0.75, baseY + offset + 120,
        size.width, baseY + offset + 30,
      );
      canvas.drawPath(path, softPaint);
    }

    // Subtle gradient glow at the bottom
    final glowPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        colors: [
          const Color(0xFFFED84C).withOpacity(0.10),
          Colors.transparent,
        ],
      ).createShader(Rect.fromLTWH(0, size.height * 0.6, size.width, size.height * 0.4));

    canvas.drawRect(Rect.fromLTWH(0, size.height * 0.6, size.width, size.height * 0.4), glowPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
