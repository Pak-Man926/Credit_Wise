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
import 'credit_prediction.dart' as _i2;
import 'credit_preference.dart' as _i3;
import 'loan_prediction.dart' as _i4;
import 'loan_preference.dart' as _i5;
import 'profile_data.dart' as _i6;
import 'user.dart' as _i7;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i8;
export 'credit_prediction.dart';
export 'credit_preference.dart';
export 'loan_prediction.dart';
export 'loan_preference.dart';
export 'profile_data.dart';
export 'user.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static String? getClassNameFromObjectJson(dynamic data) {
    if (data is! Map) return null;
    final className = data['__className__'] as String?;
    return className;
  }

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;

    final dataClassName = getClassNameFromObjectJson(data);
    if (dataClassName != null && dataClassName != getClassNameForType(t)) {
      try {
        return deserializeByClassName({
          'className': dataClassName,
          'data': data,
        });
      } on FormatException catch (_) {
        // If the className is not recognized (e.g., older client receiving
        // data with a new subtype), fall back to deserializing without the
        // className, using the expected type T.
      }
    }

    if (t == _i2.CreditPrediction) {
      return _i2.CreditPrediction.fromJson(data) as T;
    }
    if (t == _i3.CreditPreference) {
      return _i3.CreditPreference.fromJson(data) as T;
    }
    if (t == _i4.LoanPrediction) {
      return _i4.LoanPrediction.fromJson(data) as T;
    }
    if (t == _i5.LoanPreference) {
      return _i5.LoanPreference.fromJson(data) as T;
    }
    if (t == _i6.ProfileData) {
      return _i6.ProfileData.fromJson(data) as T;
    }
    if (t == _i7.Users) {
      return _i7.Users.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.CreditPrediction?>()) {
      return (data != null ? _i2.CreditPrediction.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.CreditPreference?>()) {
      return (data != null ? _i3.CreditPreference.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.LoanPrediction?>()) {
      return (data != null ? _i4.LoanPrediction.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.LoanPreference?>()) {
      return (data != null ? _i5.LoanPreference.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.ProfileData?>()) {
      return (data != null ? _i6.ProfileData.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.Users?>()) {
      return (data != null ? _i7.Users.fromJson(data) : null) as T;
    }
    try {
      return _i8.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i2.CreditPrediction => 'CreditPrediction',
      _i3.CreditPreference => 'CreditPreference',
      _i4.LoanPrediction => 'LoanPrediction',
      _i5.LoanPreference => 'LoanPreference',
      _i6.ProfileData => 'ProfileData',
      _i7.Users => 'Users',
      _ => null,
    };
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;

    if (data is Map<String, dynamic> && data['__className__'] is String) {
      return (data['__className__'] as String).replaceFirst('credit_wise.', '');
    }

    switch (data) {
      case _i2.CreditPrediction():
        return 'CreditPrediction';
      case _i3.CreditPreference():
        return 'CreditPreference';
      case _i4.LoanPrediction():
        return 'LoanPrediction';
      case _i5.LoanPreference():
        return 'LoanPreference';
      case _i6.ProfileData():
        return 'ProfileData';
      case _i7.Users():
        return 'Users';
    }
    className = _i8.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'CreditPrediction') {
      return deserialize<_i2.CreditPrediction>(data['data']);
    }
    if (dataClassName == 'CreditPreference') {
      return deserialize<_i3.CreditPreference>(data['data']);
    }
    if (dataClassName == 'LoanPrediction') {
      return deserialize<_i4.LoanPrediction>(data['data']);
    }
    if (dataClassName == 'LoanPreference') {
      return deserialize<_i5.LoanPreference>(data['data']);
    }
    if (dataClassName == 'ProfileData') {
      return deserialize<_i6.ProfileData>(data['data']);
    }
    if (dataClassName == 'Users') {
      return deserialize<_i7.Users>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i8.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  /// Maps any `Record`s known to this [Protocol] to their JSON representation
  ///
  /// Throws in case the record type is not known.
  ///
  /// This method will return `null` (only) for `null` inputs.
  Map<String, dynamic>? mapRecordToJson(Record? record) {
    if (record == null) {
      return null;
    }
    try {
      return _i8.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
