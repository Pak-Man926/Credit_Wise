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
    required this.userId,
    required this.creditUsage,
    required this.latePayment3059,
    required this.latePayment6089,
    required this.latePayment90,
    required this.openCreditLines,
  });

  factory CreditPreference({
    int? id,
    required int userId,
    required double creditUsage,
    required int latePayment3059,
    required int latePayment6089,
    required int latePayment90,
    required int openCreditLines,
  }) = _CreditPreferenceImpl;

  factory CreditPreference.fromJson(Map<String, dynamic> jsonSerialization) {
    return CreditPreference(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      creditUsage: (jsonSerialization['creditUsage'] as num).toDouble(),
      latePayment3059: jsonSerialization['latePayment3059'] as int,
      latePayment6089: jsonSerialization['latePayment6089'] as int,
      latePayment90: jsonSerialization['latePayment90'] as int,
      openCreditLines: jsonSerialization['openCreditLines'] as int,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userId;

  double creditUsage;

  int latePayment3059;

  int latePayment6089;

  int latePayment90;

  int openCreditLines;

  /// Returns a shallow copy of this [CreditPreference]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CreditPreference copyWith({
    int? id,
    int? userId,
    double? creditUsage,
    int? latePayment3059,
    int? latePayment6089,
    int? latePayment90,
    int? openCreditLines,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CreditPreference',
      if (id != null) 'id': id,
      'userId': userId,
      'creditUsage': creditUsage,
      'latePayment3059': latePayment3059,
      'latePayment6089': latePayment6089,
      'latePayment90': latePayment90,
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
    required int userId,
    required double creditUsage,
    required int latePayment3059,
    required int latePayment6089,
    required int latePayment90,
    required int openCreditLines,
  }) : super._(
         id: id,
         userId: userId,
         creditUsage: creditUsage,
         latePayment3059: latePayment3059,
         latePayment6089: latePayment6089,
         latePayment90: latePayment90,
         openCreditLines: openCreditLines,
       );

  /// Returns a shallow copy of this [CreditPreference]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CreditPreference copyWith({
    Object? id = _Undefined,
    int? userId,
    double? creditUsage,
    int? latePayment3059,
    int? latePayment6089,
    int? latePayment90,
    int? openCreditLines,
  }) {
    return CreditPreference(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      creditUsage: creditUsage ?? this.creditUsage,
      latePayment3059: latePayment3059 ?? this.latePayment3059,
      latePayment6089: latePayment6089 ?? this.latePayment6089,
      latePayment90: latePayment90 ?? this.latePayment90,
      openCreditLines: openCreditLines ?? this.openCreditLines,
    );
  }
}
