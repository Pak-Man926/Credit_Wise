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
import 'package:serverpod/serverpod.dart' as _i1;

abstract class CreditPreference
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  CreditPreference._({
    this.id,
    required this.userId,
    required this.creditUsage,
    required this.latePaymentHistory,
    required this.openCreditLines,
  });

  factory CreditPreference({
    int? id,
    required int userId,
    required double creditUsage,
    required double latePaymentHistory,
    required int openCreditLines,
  }) = _CreditPreferenceImpl;

  factory CreditPreference.fromJson(Map<String, dynamic> jsonSerialization) {
    return CreditPreference(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      creditUsage: (jsonSerialization['creditUsage'] as num).toDouble(),
      latePaymentHistory: (jsonSerialization['latePaymentHistory'] as num)
          .toDouble(),
      openCreditLines: jsonSerialization['openCreditLines'] as int,
    );
  }

  static final t = CreditPreferenceTable();

  static const db = CreditPreferenceRepository._();

  @override
  int? id;

  int userId;

  double creditUsage;

  double latePaymentHistory;

  int openCreditLines;

  @override
  _i1.Table<int?> get table => t;

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
      'userId': userId,
      'creditUsage': creditUsage,
      'latePaymentHistory': latePaymentHistory,
      'openCreditLines': openCreditLines,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CreditPreference',
      if (id != null) 'id': id,
      'userId': userId,
      'creditUsage': creditUsage,
      'latePaymentHistory': latePaymentHistory,
      'openCreditLines': openCreditLines,
    };
  }

  static CreditPreferenceInclude include() {
    return CreditPreferenceInclude._();
  }

  static CreditPreferenceIncludeList includeList({
    _i1.WhereExpressionBuilder<CreditPreferenceTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CreditPreferenceTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CreditPreferenceTable>? orderByList,
    CreditPreferenceInclude? include,
  }) {
    return CreditPreferenceIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CreditPreference.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(CreditPreference.t),
      include: include,
    );
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
    int? userId,
    double? creditUsage,
    double? latePaymentHistory,
    int? openCreditLines,
  }) {
    return CreditPreference(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      creditUsage: creditUsage ?? this.creditUsage,
      latePaymentHistory: latePaymentHistory ?? this.latePaymentHistory,
      openCreditLines: openCreditLines ?? this.openCreditLines,
    );
  }
}

class CreditPreferenceUpdateTable
    extends _i1.UpdateTable<CreditPreferenceTable> {
  CreditPreferenceUpdateTable(super.table);

  _i1.ColumnValue<int, int> userId(int value) => _i1.ColumnValue(
    table.userId,
    value,
  );

  _i1.ColumnValue<double, double> creditUsage(double value) => _i1.ColumnValue(
    table.creditUsage,
    value,
  );

  _i1.ColumnValue<double, double> latePaymentHistory(double value) =>
      _i1.ColumnValue(
        table.latePaymentHistory,
        value,
      );

  _i1.ColumnValue<int, int> openCreditLines(int value) => _i1.ColumnValue(
    table.openCreditLines,
    value,
  );
}

class CreditPreferenceTable extends _i1.Table<int?> {
  CreditPreferenceTable({super.tableRelation})
    : super(tableName: 'credit_preference') {
    updateTable = CreditPreferenceUpdateTable(this);
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    creditUsage = _i1.ColumnDouble(
      'creditUsage',
      this,
    );
    latePaymentHistory = _i1.ColumnDouble(
      'latePaymentHistory',
      this,
    );
    openCreditLines = _i1.ColumnInt(
      'openCreditLines',
      this,
    );
  }

  late final CreditPreferenceUpdateTable updateTable;

  late final _i1.ColumnInt userId;

  late final _i1.ColumnDouble creditUsage;

  late final _i1.ColumnDouble latePaymentHistory;

  late final _i1.ColumnInt openCreditLines;

  @override
  List<_i1.Column> get columns => [
    id,
    userId,
    creditUsage,
    latePaymentHistory,
    openCreditLines,
  ];
}

class CreditPreferenceInclude extends _i1.IncludeObject {
  CreditPreferenceInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => CreditPreference.t;
}

class CreditPreferenceIncludeList extends _i1.IncludeList {
  CreditPreferenceIncludeList._({
    _i1.WhereExpressionBuilder<CreditPreferenceTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(CreditPreference.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => CreditPreference.t;
}

class CreditPreferenceRepository {
  const CreditPreferenceRepository._();

  /// Returns a list of [CreditPreference]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<CreditPreference>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CreditPreferenceTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CreditPreferenceTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CreditPreferenceTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<CreditPreference>(
      where: where?.call(CreditPreference.t),
      orderBy: orderBy?.call(CreditPreference.t),
      orderByList: orderByList?.call(CreditPreference.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [CreditPreference] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<CreditPreference?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CreditPreferenceTable>? where,
    int? offset,
    _i1.OrderByBuilder<CreditPreferenceTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CreditPreferenceTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<CreditPreference>(
      where: where?.call(CreditPreference.t),
      orderBy: orderBy?.call(CreditPreference.t),
      orderByList: orderByList?.call(CreditPreference.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [CreditPreference] by its [id] or null if no such row exists.
  Future<CreditPreference?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<CreditPreference>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [CreditPreference]s in the list and returns the inserted rows.
  ///
  /// The returned [CreditPreference]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<CreditPreference>> insert(
    _i1.Session session,
    List<CreditPreference> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<CreditPreference>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [CreditPreference] and returns the inserted row.
  ///
  /// The returned [CreditPreference] will have its `id` field set.
  Future<CreditPreference> insertRow(
    _i1.Session session,
    CreditPreference row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<CreditPreference>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [CreditPreference]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<CreditPreference>> update(
    _i1.Session session,
    List<CreditPreference> rows, {
    _i1.ColumnSelections<CreditPreferenceTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<CreditPreference>(
      rows,
      columns: columns?.call(CreditPreference.t),
      transaction: transaction,
    );
  }

  /// Updates a single [CreditPreference]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<CreditPreference> updateRow(
    _i1.Session session,
    CreditPreference row, {
    _i1.ColumnSelections<CreditPreferenceTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<CreditPreference>(
      row,
      columns: columns?.call(CreditPreference.t),
      transaction: transaction,
    );
  }

  /// Updates a single [CreditPreference] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<CreditPreference?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<CreditPreferenceUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<CreditPreference>(
      id,
      columnValues: columnValues(CreditPreference.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [CreditPreference]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<CreditPreference>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<CreditPreferenceUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<CreditPreferenceTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CreditPreferenceTable>? orderBy,
    _i1.OrderByListBuilder<CreditPreferenceTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<CreditPreference>(
      columnValues: columnValues(CreditPreference.t.updateTable),
      where: where(CreditPreference.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CreditPreference.t),
      orderByList: orderByList?.call(CreditPreference.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [CreditPreference]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<CreditPreference>> delete(
    _i1.Session session,
    List<CreditPreference> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<CreditPreference>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [CreditPreference].
  Future<CreditPreference> deleteRow(
    _i1.Session session,
    CreditPreference row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<CreditPreference>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<CreditPreference>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<CreditPreferenceTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<CreditPreference>(
      where: where(CreditPreference.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CreditPreferenceTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<CreditPreference>(
      where: where?.call(CreditPreference.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
