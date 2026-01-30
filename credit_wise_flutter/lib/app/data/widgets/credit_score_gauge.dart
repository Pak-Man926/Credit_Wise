import 'package:flutter/material.dart';

class CreditScoreGauge extends StatelessWidget {
  final double score; // Simulated score (e.g., 606)
  final String scoreBand; // "A" to "E"
  final double riskProbability; // Risk percentage (e.g., 44%)

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
        painter: GaugePainter(score, scoreBand),
      ),
    );
  }
}

class GaugePainter extends CustomPainter {
  final double score;
  final String scoreBand;

  GaugePainter(this.score, this.scoreBand);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.grey.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20;

    Paint scorePaint = Paint()
      ..color = _getScoreBandColor(scoreBand)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 20;

    double angle = (score / 850) * 3.14; // Scale score to the gauge

    // Draw outer circle (gauge background)
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      size.width / 2,
      paint,
    );

    // Draw the gauge (based on score)
    canvas.drawArc(
      Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.width / 2,
      ),
      -3.14 /
          2, // Start angle (rotate so the needle starts at the 9 o'clock position)
      angle, // Ending angle based on the score
      false,
      scorePaint,
    );

    // Draw score label in the center
    TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: '$score',
        style: TextStyle(
          color: Colors.black,
          fontSize: 36,
          fontWeight: FontWeight.bold,
        ),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(
        size.width / 2 - textPainter.width / 2,
        size.height / 2 - textPainter.height / 2,
      ),
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

  Color _getScoreBandColor(String band) {
    switch (band) {
      case 'A':
        return Colors.green; // High score
      case 'B':
        return Colors.lightGreen;
      case 'C':
        return Colors.yellow;
      case 'D':
        return Colors.orange;
      case 'E':
        return Colors.red; // Low score
      default:
        return Colors.grey;
    }
  }
}
