import "dart:async";
import "dart:developer";
import "package:serverpod/serverpod.dart";
import "../generated/profile_data.dart";

class ProfileEndpoint extends Endpoint {
  Future<void> createProfileData(
    Session session,
    int userId,
    int age,
    int dependants,
    double monthlyIncome,
    double debtRatio,
    double contributorIncome,
  ) async {
    var profileData = await ProfileData.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(userId),
    );

    if (profileData != null) {
      profileData.age = age;
      profileData.dependants = dependants;
      profileData.monthlyIncome = monthlyIncome;
      profileData.debtRatio = debtRatio;
      profileData.contributorIncome = contributorIncome;

      await ProfileData.db.updateRow(session, profileData);

      debugger();
    } else {
      var newProfileData = ProfileData(
        userId: userId,
        age: age,
        dependants: dependants,
        monthlyIncome: monthlyIncome,
        debtRatio: debtRatio,
        contributorIncome: contributorIncome,
      );

      await ProfileData.db.insertRow(session, newProfileData);

      debugger();
    }
  }
}
