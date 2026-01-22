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

abstract class CreditPreference implements _i1.SerializableModel {
  CreditPreference._({
    this.id,
    this.userId,
    required this.creditUsage,
    required this.latePaymentHistory,
    required this.openCreditLines,
  });

  factory CreditPreference({
    int? id,
    int? userId,
    required double creditUsage,
    required double latePaymentHistory,
    required int openCreditLines,
  }) = _CreditPreferenceImpl;

  factory CreditPreference.fromJson(Map<String, dynamic> jsonSerialization) {
    return CreditPreference(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int?,
      creditUsage: (jsonSerialization['creditUsage'] as num).toDouble(),
      latePaymentHistory: (jsonSerialization['latePaymentHistory'] as num)
          .toDouble(),
      openCreditLines: jsonSerialization['openCreditLines'] as int,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int? userId;

  double creditUsage;

  double latePaymentHistory;

  int openCreditLines;

  /// Returns a shallow copy of this [CreditPreference]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CreditPreference copyWith({
    int? id,
    int? userId,
    double? creditUsage,
    double? latePaymentHistory,
    int? openCreditLines,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CreditPreference',
      if (id != null) 'id': id,
      if (userId != null) 'userId': userId,
      'creditUsage': creditUsage,
      'latePaymentHistory': latePaymentHistory,
      'openCreditLines': openCreditLines,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CreditPreferenceImpl extends CreditPreference {
  _CreditPreferenceImpl({
    int? id,
    int? userId,
    required double creditUsage,
    required double latePaymentHistory,
    required int openCreditLines,
  }) : super._(
         id: id,
         userId: userId,
         creditUsage: creditUsage,
         latePaymentHistory: latePaymentHistory,
         openCreditLines: openCreditLines,
       );

  /// Returns a shallow copy of this [CreditPreference]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CreditPreference copyWith({
    Object? id = _Undefined,
    Object? userId = _Undefined,
    double? creditUsage,
    double? latePaymentHistory,
    int? openCreditLines,
  }) {
    return CreditPreference(
      id: id is int? ? id : this.id,
      userId: userId is int? ? userId : this.userId,
      creditUsage: creditUsage ?? this.creditUsage,
      latePaymentHistory: latePaymentHistory ?? this.latePaymentHistory,
      openCreditLines: openCreditLines ?? this.openCreditLines,
    );
  }
}
