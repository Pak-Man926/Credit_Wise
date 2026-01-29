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

abstract class LoanPrediction implements _i1.SerializableModel {
  LoanPrediction._({
    this.id,
    required this.userId,
    required this.approvalProbability,
    required this.approvalBand,
    required this.createdAt,
  });

  factory LoanPrediction({
    int? id,
    required int userId,
    required double approvalProbability,
    required String approvalBand,
    required DateTime createdAt,
  }) = _LoanPredictionImpl;

  factory LoanPrediction.fromJson(Map<String, dynamic> jsonSerialization) {
    return LoanPrediction(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      approvalProbability: (jsonSerialization['approvalProbability'] as num)
          .toDouble(),
      approvalBand: jsonSerialization['approvalBand'] as String,
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

  double approvalProbability;

  String approvalBand;

  DateTime createdAt;

  /// Returns a shallow copy of this [LoanPrediction]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  LoanPrediction copyWith({
    int? id,
    int? userId,
    double? approvalProbability,
    String? approvalBand,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'LoanPrediction',
      if (id != null) 'id': id,
      'userId': userId,
      'approvalProbability': approvalProbability,
      'approvalBand': approvalBand,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _LoanPredictionImpl extends LoanPrediction {
  _LoanPredictionImpl({
    int? id,
    required int userId,
    required double approvalProbability,
    required String approvalBand,
    required DateTime createdAt,
  }) : super._(
         id: id,
         userId: userId,
         approvalProbability: approvalProbability,
         approvalBand: approvalBand,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [LoanPrediction]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  LoanPrediction copyWith({
    Object? id = _Undefined,
    int? userId,
    double? approvalProbability,
    String? approvalBand,
    DateTime? createdAt,
  }) {
    return LoanPrediction(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      approvalProbability: approvalProbability ?? this.approvalProbability,
      approvalBand: approvalBand ?? this.approvalBand,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
