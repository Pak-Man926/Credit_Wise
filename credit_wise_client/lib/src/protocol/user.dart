/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'gender.dart' as _i2;

abstract class Users implements _i1.SerializableModel {
  Users._({
    this.id,
    required this.firstName,
    required this.secondName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.gender,
    required this.createdAt,
  });

  factory Users({
    int? id,
    required String firstName,
    required String secondName,
    required String lastName,
    required String email,
    required int phoneNumber,
    required String password,
    required _i2.Gender gender,
    required DateTime createdAt,
  }) = _UsersImpl;

  factory Users.fromJson(Map<String, dynamic> jsonSerialization) {
    return Users(
      id: jsonSerialization['id'] as int?,
      firstName: jsonSerialization['firstName'] as String,
      secondName: jsonSerialization['secondName'] as String,
      lastName: jsonSerialization['lastName'] as String,
      email: jsonSerialization['email'] as String,
      phoneNumber: jsonSerialization['phoneNumber'] as int,
      password: jsonSerialization['password'] as String,
      gender: _i2.Gender.fromJson((jsonSerialization['gender'] as int)),
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String firstName;

  String secondName;

  String lastName;

  String email;

  int phoneNumber;

  String password;

  _i2.Gender gender;

  DateTime createdAt;

  /// Returns a shallow copy of this [Users]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Users copyWith({
    int? id,
    String? firstName,
    String? secondName,
    String? lastName,
    String? email,
    int? phoneNumber,
    String? password,
    _i2.Gender? gender,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'firstName': firstName,
      'secondName': secondName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'password': password,
      'gender': gender.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UsersImpl extends Users {
  _UsersImpl({
    int? id,
    required String firstName,
    required String secondName,
    required String lastName,
    required String email,
    required int phoneNumber,
    required String password,
    required _i2.Gender gender,
    required DateTime createdAt,
  }) : super._(
          id: id,
          firstName: firstName,
          secondName: secondName,
          lastName: lastName,
          email: email,
          phoneNumber: phoneNumber,
          password: password,
          gender: gender,
          createdAt: createdAt,
        );

  /// Returns a shallow copy of this [Users]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Users copyWith({
    Object? id = _Undefined,
    String? firstName,
    String? secondName,
    String? lastName,
    String? email,
    int? phoneNumber,
    String? password,
    _i2.Gender? gender,
    DateTime? createdAt,
  }) {
    return Users(
      id: id is int? ? id : this.id,
      firstName: firstName ?? this.firstName,
      secondName: secondName ?? this.secondName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
      gender: gender ?? this.gender,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
