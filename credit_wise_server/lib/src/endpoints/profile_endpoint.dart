import 'dart:async';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';
import '../generated/profile_data.dart';
import '../generated/user.dart' as app;

class ProfileEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<void> createProfileData(
    Session session,
    int age,
    int dependants,
    double monthlyIncome,
    double debtRatio,
    double contributorIncome,
  ) async {
    // 1. Get auth user id from session
    final authInfo = await session.authenticated;
    final authUserId = authInfo?.userId; // UserInfo.id

    if (authUserId == null) {
      throw Exception(' User not authenticated');
    }

    // 2. Find your app user row linked to this auth user
    final appUser = await app.Users.db.findFirstRow(
      session,
      where: (t) => t.userInfoId.equals(authUserId),
    );

    if (appUser == null) {
      throw Exception('No app user for this auth user');
    }

    final appUserId = appUser.id!;

    // 3. Upsert ProfileData by appUserId
    var profileData = await ProfileData.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(appUserId),
    );

    if (profileData != null) {
      profileData
        ..age = age
        ..dependants = dependants
        ..monthlyIncome = monthlyIncome
        ..debtRatio = debtRatio
        ..contributorIncome = contributorIncome;

      await ProfileData.db.updateRow(session, profileData);
    } else {
      final newProfileData = ProfileData(
        userId: appUserId,
        age: age,
        dependants: dependants,
        monthlyIncome: monthlyIncome,
        debtRatio: debtRatio,
        contributorIncome: contributorIncome,
      );

      await ProfileData.db.insertRow(session, newProfileData);
    }
  }
}
