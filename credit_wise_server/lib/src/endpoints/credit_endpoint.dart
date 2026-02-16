import "dart:async";
import "dart:developer";
import "package:serverpod/serverpod.dart";
import "package:serverpod_auth_server/serverpod_auth_server.dart";
import "../generated/credit_preference.dart";
import '../generated/user.dart' as app;

class CreditEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<void> createCreditPreference(
    Session session,
    double creditUsage,
    int latePayment30_59,
    int latePayment60_89,
    int latePayment90,
    int openCreditLines,
  ) async {
    // Get the authenticated user's ID
    final authInfo = await session.authenticated;
    final userId = authInfo?.userId;

    if (userId == null) {
      throw Exception('User not authenticated');
    }

    var appUser = await app.Users.db.findFirstRow(
      session,
      where: (t) => t.userInfoId.equals(userId),
    );

    if (appUser == null) {
      throw Exception("No app user found for this authenticated user");
    }

    final appUserId = appUser.id!;

    var creditPreferenceData = await CreditPreference.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(appUserId),
    );

    if (creditPreferenceData != null) {
      creditPreferenceData
        ..creditUsage = creditUsage
        ..latePayment3059 = latePayment30_59
        ..latePayment6089 = latePayment60_89
        ..latePayment90 = latePayment90
        ..openCreditLines = openCreditLines;

      await CreditPreference.db.updateRow(session, creditPreferenceData);
    } else {
      final newCreditPreferenceData = CreditPreference(
        userId: appUserId,
        creditUsage: creditUsage,
        latePayment3059: latePayment30_59,
        latePayment6089: latePayment60_89,
        latePayment90: latePayment90,
        openCreditLines: openCreditLines,
      );
      await CreditPreference.db.insertRow(session, newCreditPreferenceData);
    }
  }
}
