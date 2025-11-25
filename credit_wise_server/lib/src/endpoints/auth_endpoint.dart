import "dart:async";

import "package:bcrypt/bcrypt.dart";
import "package:serverpod/serverpod.dart";
import "../generated/gender.dart";
import "../generated/user.dart";

class AuthEndpoint extends Endpoint {
  Future<bool> registerUser(
    Session session,
    String firstName,
    String secondName,
    String lastName,
    String email,
    int phoneNumber,
    Gender gender,
    String password,
  ) async {
    var existingUser = await Users.db.findFirstRow(
      session,
      where: (t) => t.phoneNumber.equals(phoneNumber),
    );

    if (existingUser != null) {
      return false; // User already exists
    }
    // Create a new user

    final hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

    final user = Users(
        firstName: firstName,
        secondName: secondName,
        lastName: lastName,
        phoneNumber: phoneNumber,
        email: email,
        password: hashedPassword,
        gender: gender,
        createdAt: DateTime.now());

    await Users.db.insertRow(session, user);

    return true;
  }

  //User Login endpoint call
  Future<bool> loginUser(
    Session session,
    int phoneNumber,
    String password,
  ) async {
    // Step 1: Find user by contacts only
    var registeredUser = await Users.db.findFirstRow(
      session,
      where: (t) => t.phoneNumber.equals(phoneNumber),
    );

    // Step 2: Check if user exists
    if (registeredUser == null) {
      return false;
    }

    // Step 3: Validate password with bcrypt
    final bool checkPassword =
        BCrypt.checkpw(password, registeredUser.password);

    if (!checkPassword) {
      return false;
    }

    return true;
  }
}
