import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart' hide Users;
import '../generated/protocol.dart';

class PredictionEndpoint extends Endpoint {
  // FastAPI URL
  final String fastApiUrl = 'http://127.0.0.1:8000/credit-score';

  Future<CreditPrediction?> getCreditScore(Session session) async {
    // 1. Get authenticated user id
    final authInfo = await session.authenticated;
    final userId = authInfo?.userId;
    if (userId == null) return null;

    // 2. Check DB cache (e.g. 24h)
    final existingScore = await CreditPrediction.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(userId),
    );

    if (existingScore != null &&
        existingScore.createdAt
            .isAfter(DateTime.now().subtract(const Duration(hours: 24)))) {
      return existingScore;
    }

    // 3. Load related data directly by userId
    final profile = await ProfileData.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(userId),
    );

    final credit = await CreditPreference.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(userId),
    );

    // Require profile at minimum
    if (profile == null || credit == null) return null;

    // 4. Build request payload for FastAPI
    final requestBody = {
      'RevolvingUtilizationOfUnsecuredLines': credit.creditUsage,
      'age': profile.age,
      'DebtRatio': profile.debtRatio,
      'MonthlyIncome': profile.monthlyIncome,
      'NumberOfOpenCreditLinesAndLoans': credit.openCreditLines,
      'NumberOfTimes90DaysLate': credit.latePayment90,
      'NumberRealEstateLoansOrLines': 0,
      'NumberOfTime30-59DaysPastDueNotWorse': credit.latePayment3059,
      'NumberOfTime60-89DaysPastDueNotWorse': credit.latePayment6089,
      'NumberOfDependents': profile.dependants,
    };

    session.log("$requestBody");

    try {
      final response = await http.post(
        Uri.parse(fastApiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({"data": requestBody}),
      );

      if (response.statusCode != 200) {
        session.log(
          'FastAPI error: status=${response.statusCode}, body=${response.body}',
        );
        return null;
      }

      final data = jsonDecode(response.body) as Map<String, dynamic>;

      // 5. Map API response into your Serverpod model
      final newResult = CreditPrediction(
        userId: userId,
        riskProbability: (data["default_risk_probability"] as num).toDouble(),
        simulatedScore: (data["simulated_score"] as num).toInt(),
        scoreBand: data["score_band"] as String,
        createdAt: DateTime.now(),
      );

      // 6. Save to DB
      await CreditPrediction.db.insertRow(session, newResult);

      return newResult;
    } catch (e, st) {
      session.log('FastAPI Connection Error: $e\n$st');
      return null;
    }
  }
}
