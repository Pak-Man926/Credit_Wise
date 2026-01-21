import "dart:async";
import "dart:developer";
import "package:serverpod/serverpod.dart";
import "../generated/loan_preference.dart";

class LoanEndpoint extends Endpoint {
  Future<void> createLoanPreference(
    Session session,
    int userId,
    double loanAmount,
    int repaymentPeriod,
    double repaymentHistory,
    String employmentType,
  ) async {
    var loanPreferenceData = await LoanPreference.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(userId),
    );

    if (loanPreferenceData != null) {
      loanPreferenceData.loanAmount = loanAmount;
      loanPreferenceData.repaymentPeriod = repaymentPeriod;
      loanPreferenceData.repaymentHistory = repaymentHistory;
      loanPreferenceData.employmentType = employmentType;

      await LoanPreference.db.updateRow(session, loanPreferenceData);

      debugger();
    } else {
      var newLoanPreferenceData = LoanPreference(
        userId: userId,
        loanAmount: loanAmount,
        repaymentPeriod: repaymentPeriod,
        repaymentHistory: repaymentHistory,
        employmentType: employmentType,
      );
      await LoanPreference.db.insertRow(session, newLoanPreferenceData);

      debugger();
    }
  }
}
