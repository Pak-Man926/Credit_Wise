import "dart:async";
import "dart:developer";
import "package:serverpod/serverpod.dart";
import "package:serverpod_auth_server/serverpod_auth_server.dart";
import "../generated/loan_preference.dart";
import '../generated/user.dart' as app;

class LoanEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<void> createLoanPreference(
    Session session,
    double loanAmount,
    int repaymentPeriod,
    double repaymentHistory,
    String employmentType,
  ) async {
    final authInfo = await session.authenticated;
    final authUserId = authInfo?.userId;

    if (authUserId == null) {
      throw Exception('User not authenticated');
    }

    final appUser = await app.Users.db.findFirstRow(
      session,
      where: (t) => t.userInfoId.equals(authUserId),
    );

    if (appUser == null) {
      throw Exception("No app user is found for this auth user");
    }

    final appUserId = appUser.id!;

    var loanPreferenceData = await LoanPreference.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(appUserId),
    );

    if (loanPreferenceData != null) {
      loanPreferenceData
        ..loanAmount = loanAmount
        ..repaymentPeriod = repaymentPeriod
        ..repaymentHistory = repaymentHistory
        ..employmentType = employmentType;

      await LoanPreference.db.updateRow(session, loanPreferenceData);
    } else {
      var newLoanPreferenceData = LoanPreference(
        userId: appUserId,
        loanAmount: loanAmount,
        repaymentPeriod: repaymentPeriod,
        repaymentHistory: repaymentHistory,
        employmentType: employmentType,
      );
      await LoanPreference.db.insertRow(session, newLoanPreferenceData);
    }
  }
}
