import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as proto;
import '../generated/protocol.dart';

class LoanPredictionEndpoint extends Endpoint {
  final String fastApiUrl = "http://127.0.0.1:8000/loan-approval";

  Future<LoanPrediction?> getLoanPrediction(Session session) async {
    // 1. Get the authenticated User ID
    var authInfo = await session.authenticated;
    var userId = authInfo?.userId;
    if (userId == null) return null;

    // 2. Check Database first (Caching) to reduce API calls
    var existingLoanPrediction = await LoanPrediction.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(userId),
    );

    // If data is fresh (e.g., less than 24 hours old), return it immediately
    if (existingLoanPrediction != null &&
        existingLoanPrediction.createdAt
            .isAfter(DateTime.now().subtract(Duration(hours: 24)))) {
      return existingLoanPrediction;
    }

    // 3. Retrieve all related data for the API request
    final user = await Users.db.findFirstRow(
      session,
      where: (t) => t.userInfoId.equals(userId),
    );

    final profile = await ProfileData.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(userId),
    );

    final loan = await LoanPreference.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(userId),
    );

    if (profile == null || loan == null || user == null) return null;

    session.log("Setting up preferences body");

    final requestBody = {
      "Gender": user.gender,
      "Married": profile.contributorIncome == 0 ? "No" : "Yes",
      "Dependents": profile.dependants,
      "Education": "",
      "Self_Employed": loan.employmentType,
      "ApplicantIncome": profile.monthlyIncome,
      "CoapplicantIncome": profile.contributorIncome,
      "LoanAmount": loan.loanAmount,
      "Loan_Amount_Term": loan.repaymentPeriod,
      "Credit_History": loan.repaymentHistory,
      "Property_Area": ""
    };

    session.log("$requestBody");

    // 4. Submit data to FastAPI
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

      session.log("Api response: $data");

      // 5. Map API response into your Serverpod model
      final newResult = LoanPrediction(
        userId: userId,
        approvalProbability: (data["approval_probability"] as num?)?.toDouble() ?? 0.0,
        approvalBand: data["approval_band"] as String? ?? '',
        createdAt: DateTime.now(),
      );
      // 6. Save to DB
      await LoanPrediction.db.insertRow(session, newResult);

      return newResult;
    } catch (e, st) {
      session.log('FastAPI Connection Error: $e\n$st');
      return null;
    }
  }
}
