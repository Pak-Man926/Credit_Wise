import "dart:async";
import "dart:developer";
import "package:serverpod/serverpod.dart";
import "../generated/credit_preference.dart";

class CreditEndpoint extends Endpoint{
  Future<void> createCreditPreference(
    Session session,
    int userId,
    double creditUsage,
    double latePaymentHistory,
    int openCreditLines,
  ) async {
    var creditPreferenceData = await CreditPreference.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(userId),
    );

    if (creditPreferenceData != null) {
      creditPreferenceData.creditUsage = creditUsage;
      creditPreferenceData.latePaymentHistory = latePaymentHistory;
      creditPreferenceData.openCreditLines = openCreditLines;

      await CreditPreference.db.updateRow(session, creditPreferenceData);

      debugger();
    } else {
      var newCreditPreferenceData = CreditPreference(
        userId: userId,
        creditUsage: creditUsage,
        latePaymentHistory: latePaymentHistory,
        openCreditLines: openCreditLines,
      );
      await CreditPreference.db.insertRow(session, newCreditPreferenceData);

      debugger();
    }
  }
}