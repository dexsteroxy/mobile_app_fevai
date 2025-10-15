import 'package:flutter/material.dart';

class PatternMoneyBackground extends StatelessWidget {
  const PatternMoneyBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.black,
      child: CustomPaint(
        size: MediaQuery.of(context).size,
        painter: _MoneyPatternPainter(),
      ),
    );
  }
}

class _MoneyPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFFFD84D).withOpacity(0.20)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    final double centerX = size.width * 0.4;
    final double centerY = size.height * 0.4;

    // Draw curved lines radiating outwards like the image
    for (int i = 0; i < 10; i++) {
      final path = Path();
      final offset = i * 25.0;
      path.moveTo(0, centerY - offset);
      path.quadraticBezierTo(centerX, centerY, size.width, centerY + offset);
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
