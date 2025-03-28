import 'dart:math';

import 'package:flutter/material.dart';

class SummaryCard extends StatelessWidget {
  const SummaryCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          const BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Thông tin văn bản
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Today Profit",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "210B đ",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
              const SizedBox(height: 4),
              Text(
                "- 100B đ",
                style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
              ),
            ],
          ),
          CircularProgressWidget(
            percentage: 0.6, // 60%
            size: 100, // Điều chỉnh kích thước
            backgroundColor: Colors.grey.shade300,
            progressColor: Colors.red,
          ),
        ],
      ),
    );
  }
}

class CircularProgressWidget extends StatelessWidget {
  final double percentage;
  final double size;
  final Color backgroundColor;
  final Color progressColor;

  const CircularProgressWidget({
    Key? key,
    required this.percentage,
    this.size = 100,
    this.backgroundColor = Colors.grey,
    this.progressColor = Colors.red,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: CirclePainter(
          percentage: percentage,
          backgroundColor: backgroundColor,
          progressColor: progressColor,
        ),
        child: Center(
          child: Text(
            "${(percentage * 100).toInt()}%",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  final double percentage;
  final Color backgroundColor;
  final Color progressColor;

  CirclePainter({
    required this.percentage,
    required this.backgroundColor,
    required this.progressColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint backgroundPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;

    Paint progressPaint = Paint()
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = size.width / 2 - 10; // Để chừa khoảng stroke

    // Vẽ vòng tròn nền
    canvas.drawCircle(center, radius, backgroundPaint);

    // Vẽ vòng tròn tiến trình
    double startAngle = -pi / 2;
    double sweepAngle = 2 * pi * percentage;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(CirclePainter oldDelegate) {
    return oldDelegate.percentage != percentage;
  }
}
