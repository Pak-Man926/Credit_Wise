import "dart:async";

import "package:bcrypt/bcrypt.dart";
import "package:serverpod/serverpod.dart";
import "package:serverpod_auth_server/serverpod_auth_server.dart" as auth;
import "package:serverpod_auth_server/serverpod_auth_server.dart";
import "../generated/user.dart" as app;

class AuthEndpoint extends Endpoint {
  Future<bool> registerUser(
    Session session,
    String firstName,
    String secondName,
    String lastName,
    String email,
    int phoneNumber,
    String gender,
    String password,
  ) async {
    var existingUser = await app.Users.db.findFirstRow(
      session,
      where: (t) => t.phoneNumber.equals(phoneNumber),
    );

    if (existingUser != null) {
      return false; // User already exists
    }
    // Create a new user

    final hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

    final user = app.Users(
        firstName: firstName,
        secondName: secondName,
        lastName: lastName,
        phoneNumber: phoneNumber,
        email: email,
        password: hashedPassword,
        gender: gender,
        createdAt: DateTime.now());

    await app.Users.db.insertRow(session, user);

    return true;
  }

  //User Login endpoint call
  Future<AuthenticationResponse> loginUser(
    Session session,
    int phoneNumber,
    String password,
  ) async {
    // 1. Your own Users table
    final registeredUser = await app.Users.db.findFirstRow(
      session,
      where: (t) => t.phoneNumber.equals(phoneNumber),
    );

    if (registeredUser == null) {
      return AuthenticationResponse(success: false);
    }

    final isValidPassword = BCrypt.checkpw(password, registeredUser.password);
    if (!isValidPassword) {
      return AuthenticationResponse(success: false);
    }

    // 2. Auth module Users helper
    const authMethod = 'phonePassword';

    auth.UserInfo? userInfo =
        await auth.Users.findUserByIdentifier(session, phoneNumber.toString());

    if (userInfo == null) {
      userInfo = auth.UserInfo(
        userIdentifier: phoneNumber.toString(),
        userName: '${registeredUser.firstName} ${registeredUser.lastName}',
        email: registeredUser.email,
        blocked: false,
        created: DateTime.now().toUtc(),
        scopeNames: [],
      );
      userInfo = await auth.Users.createUser(session, userInfo, authMethod);
    }

    final authToken = await auth.UserAuthentication.signInUser(
      session,
      userInfo!.id!,
      authMethod,
      scopes: {},
    );

    return AuthenticationResponse(
      success: true,
      keyId: authToken.id,
      key: authToken.key,
      userInfo: userInfo,
    );
  }
}
