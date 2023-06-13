import 'package:flutter/material.dart';

class LinePainter extends CustomPainter {
  Color color;
  Offset startPoint;
  Offset endPoint;

  LinePainter(
      {required this.color, required this.startPoint, required this.endPoint});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2;
    canvas.drawLine(startPoint, endPoint, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
