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

abstract class CreditPrediction implements _i1.SerializableModel {
  CreditPrediction._({
    this.id,
    required this.userId,
    required this.riskProbability,
    required this.simulatedScore,
    required this.scoreBand,
    required this.createdAt,
  });

  factory CreditPrediction({
    int? id,
    required int userId,
    required double riskProbability,
    required int simulatedScore,
    required String scoreBand,
    required DateTime createdAt,
  }) = _CreditPredictionImpl;

  factory CreditPrediction.fromJson(Map<String, dynamic> jsonSerialization) {
    return CreditPrediction(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      riskProbability: (jsonSerialization['riskProbability'] as num).toDouble(),
      simulatedScore: jsonSerialization['simulatedScore'] as int,
      scoreBand: jsonSerialization['scoreBand'] as String,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userId;

  double riskProbability;

  int simulatedScore;

  String scoreBand;

  DateTime createdAt;

  /// Returns a shallow copy of this [CreditPrediction]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CreditPrediction copyWith({
    int? id,
    int? userId,
    double? riskProbability,
    int? simulatedScore,
    String? scoreBand,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CreditPrediction',
      if (id != null) 'id': id,
      'userId': userId,
      'riskProbability': riskProbability,
      'simulatedScore': simulatedScore,
      'scoreBand': scoreBand,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CreditPredictionImpl extends CreditPrediction {
  _CreditPredictionImpl({
    int? id,
    required int userId,
    required double riskProbability,
    required int simulatedScore,
    required String scoreBand,
    required DateTime createdAt,
  }) : super._(
         id: id,
         userId: userId,
         riskProbability: riskProbability,
         simulatedScore: simulatedScore,
         scoreBand: scoreBand,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [CreditPrediction]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CreditPrediction copyWith({
    Object? id = _Undefined,
    int? userId,
    double? riskProbability,
    int? simulatedScore,
    String? scoreBand,
    DateTime? createdAt,
  }) {
    return CreditPrediction(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      riskProbability: riskProbability ?? this.riskProbability,
      simulatedScore: simulatedScore ?? this.simulatedScore,
      scoreBand: scoreBand ?? this.scoreBand,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
