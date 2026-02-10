import 'package:flutter/material.dart';

class CreditScoreGauge extends StatelessWidget {
  final double score; // Simulated score (e.g., 606)
  final String scoreBand; // "A" to "E"
  final double riskProbability; // Risk percentage (e.g., 0.44)

  CreditScoreGauge({
    required this.score,
    required this.scoreBand,
    required this.riskProbability,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        size: Size(300, 300),
        painter: GaugePainter(score, scoreBand, riskProbability),
      ),
    );
  }
}

class GaugePainter extends CustomPainter {
  final double score;
  final String scoreBand;
  final double riskProbability;

  GaugePainter(this.score, this.scoreBand, this.riskProbability);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // Background ring
    Paint bgPaint = Paint()
      ..color = Colors.grey.withOpacity(0.15)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 22;

    canvas.drawCircle(center, radius, bgPaint);

    // Score arc with gradient
    double angle = (score / 850) * 3.14;
    final bandColor = _getScoreBandColor(scoreBand);

    Paint scorePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 22;

    // Create a gradient effect by using a shader
    final gradientRect = Rect.fromCircle(center: center, radius: radius);
    scorePaint.shader = SweepGradient(
      startAngle: -3.14 / 2,
      endAngle: -3.14 / 2 + angle,
      colors: [
        bandColor.withOpacity(0.5),
        bandColor,
      ],
      stops: const [0.0, 1.0],
    ).createShader(gradientRect);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -3.14 / 2,
      angle,
      false,
      scorePaint,
    );

    // Score number in center (integer, no decimals)
    TextPainter scoreTp = TextPainter(
      text: TextSpan(
        text: '${score.toInt()}',
        style: TextStyle(
          color: Colors.black,
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    scoreTp.layout();
    scoreTp.paint(
      canvas,
      Offset(
        center.dx - scoreTp.width / 2,
        center.dy - scoreTp.height / 2 - 12,
      ),
    );

    // Score band label below the score
    TextPainter bandTp = TextPainter(
      text: TextSpan(
        text: 'Band $scoreBand',
        style: TextStyle(
          color: bandColor,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    bandTp.layout();
    bandTp.paint(
      canvas,
      Offset(
        center.dx - bandTp.width / 2,
        center.dy + scoreTp.height / 2 - 8,
      ),
    );
  }

  @override
  bool shouldRepaint(covariant GaugePainter oldDelegate) {
    return oldDelegate.score != score ||
        oldDelegate.scoreBand != scoreBand ||
        oldDelegate.riskProbability != riskProbability;
  }

  Color _getScoreBandColor(String band) {
    switch (band) {
      case 'A':
        return Colors.green; // High score
      case 'B':
        return Colors.lightGreen;
      case 'C':
        return Colors.yellow.shade700;
      case 'D':
        return Colors.orange;
      case 'E':
        return Colors.red; // Low score
      default:
        return Colors.grey;
    }
  }
}
