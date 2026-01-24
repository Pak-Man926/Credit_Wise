/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class LoanPreference implements _i1.SerializableModel {
  LoanPreference._({
    this.id,
    required this.userId,
    required this.loanAmount,
    required this.repaymentPeriod,
    required this.repaymentHistory,
    required this.employmentType,
  });

  factory LoanPreference({
    int? id,
    required int userId,
    required double loanAmount,
    required int repaymentPeriod,
    required double repaymentHistory,
    required String employmentType,
  }) = _LoanPreferenceImpl;

  factory LoanPreference.fromJson(Map<String, dynamic> jsonSerialization) {
    return LoanPreference(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      loanAmount: (jsonSerialization['loanAmount'] as num).toDouble(),
      repaymentPeriod: jsonSerialization['repaymentPeriod'] as int,
      repaymentHistory: (jsonSerialization['repaymentHistory'] as num)
          .toDouble(),
      employmentType: jsonSerialization['employmentType'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userId;

  double loanAmount;

  int repaymentPeriod;

  double repaymentHistory;

  String employmentType;

  /// Returns a shallow copy of this [LoanPreference]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  LoanPreference copyWith({
    int? id,
    int? userId,
    double? loanAmount,
    int? repaymentPeriod,
    double? repaymentHistory,
    String? employmentType,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'LoanPreference',
      if (id != null) 'id': id,
      'userId': userId,
      'loanAmount': loanAmount,
      'repaymentPeriod': repaymentPeriod,
      'repaymentHistory': repaymentHistory,
      'employmentType': employmentType,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _LoanPreferenceImpl extends LoanPreference {
  _LoanPreferenceImpl({
    int? id,
    required int userId,
    required double loanAmount,
    required int repaymentPeriod,
    required double repaymentHistory,
    required String employmentType,
  }) : super._(
         id: id,
         userId: userId,
         loanAmount: loanAmount,
         repaymentPeriod: repaymentPeriod,
         repaymentHistory: repaymentHistory,
         employmentType: employmentType,
       );

  /// Returns a shallow copy of this [LoanPreference]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  LoanPreference copyWith({
    Object? id = _Undefined,
    int? userId,
    double? loanAmount,
    int? repaymentPeriod,
    double? repaymentHistory,
    String? employmentType,
  }) {
    return LoanPreference(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      loanAmount: loanAmount ?? this.loanAmount,
      repaymentPeriod: repaymentPeriod ?? this.repaymentPeriod,
      repaymentHistory: repaymentHistory ?? this.repaymentHistory,
      employmentType: employmentType ?? this.employmentType,
    );
  }
}
