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

abstract class ProfileData implements _i1.SerializableModel {
  ProfileData._({
    this.id,
    required this.userId,
    required this.age,
    required this.dependants,
    required this.monthlyIncome,
    required this.debtRatio,
    required this.contributorIncome,
  });

  factory ProfileData({
    int? id,
    required int userId,
    required int age,
    required int dependants,
    required double monthlyIncome,
    required double debtRatio,
    required double contributorIncome,
  }) = _ProfileDataImpl;

  factory ProfileData.fromJson(Map<String, dynamic> jsonSerialization) {
    return ProfileData(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      age: jsonSerialization['age'] as int,
      dependants: jsonSerialization['dependants'] as int,
      monthlyIncome: (jsonSerialization['monthlyIncome'] as num).toDouble(),
      debtRatio: (jsonSerialization['debtRatio'] as num).toDouble(),
      contributorIncome: (jsonSerialization['contributorIncome'] as num)
          .toDouble(),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userId;

  int age;

  int dependants;

  double monthlyIncome;

  double debtRatio;

  double contributorIncome;

  /// Returns a shallow copy of this [ProfileData]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ProfileData copyWith({
    int? id,
    int? userId,
    int? age,
    int? dependants,
    double? monthlyIncome,
    double? debtRatio,
    double? contributorIncome,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ProfileData',
      if (id != null) 'id': id,
      'userId': userId,
      'age': age,
      'dependants': dependants,
      'monthlyIncome': monthlyIncome,
      'debtRatio': debtRatio,
      'contributorIncome': contributorIncome,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ProfileDataImpl extends ProfileData {
  _ProfileDataImpl({
    int? id,
    required int userId,
    required int age,
    required int dependants,
    required double monthlyIncome,
    required double debtRatio,
    required double contributorIncome,
  }) : super._(
         id: id,
         userId: userId,
         age: age,
         dependants: dependants,
         monthlyIncome: monthlyIncome,
         debtRatio: debtRatio,
         contributorIncome: contributorIncome,
       );

  /// Returns a shallow copy of this [ProfileData]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ProfileData copyWith({
    Object? id = _Undefined,
    int? userId,
    int? age,
    int? dependants,
    double? monthlyIncome,
    double? debtRatio,
    double? contributorIncome,
  }) {
    return ProfileData(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      age: age ?? this.age,
      dependants: dependants ?? this.dependants,
      monthlyIncome: monthlyIncome ?? this.monthlyIncome,
      debtRatio: debtRatio ?? this.debtRatio,
      contributorIncome: contributorIncome ?? this.contributorIncome,
    );
  }
}
