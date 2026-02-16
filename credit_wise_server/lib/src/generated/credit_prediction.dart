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

abstract class CreditPrediction
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = CreditPredictionTable();

  static const db = CreditPredictionRepository._();

  @override
  int? id;

  int userId;

  double riskProbability;

  int simulatedScore;

  String scoreBand;

  DateTime createdAt;

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
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

  static CreditPredictionInclude include() {
    return CreditPredictionInclude._();
  }

  static CreditPredictionIncludeList includeList({
    _i1.WhereExpressionBuilder<CreditPredictionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CreditPredictionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CreditPredictionTable>? orderByList,
    CreditPredictionInclude? include,
  }) {
    return CreditPredictionIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CreditPrediction.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(CreditPrediction.t),
      include: include,
    );
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

class CreditPredictionUpdateTable
    extends _i1.UpdateTable<CreditPredictionTable> {
  CreditPredictionUpdateTable(super.table);

  _i1.ColumnValue<int, int> userId(int value) => _i1.ColumnValue(
    table.userId,
    value,
  );

  _i1.ColumnValue<double, double> riskProbability(double value) =>
      _i1.ColumnValue(
        table.riskProbability,
        value,
      );

  _i1.ColumnValue<int, int> simulatedScore(int value) => _i1.ColumnValue(
    table.simulatedScore,
    value,
  );

  _i1.ColumnValue<String, String> scoreBand(String value) => _i1.ColumnValue(
    table.scoreBand,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );
}

class CreditPredictionTable extends _i1.Table<int?> {
  CreditPredictionTable({super.tableRelation})
    : super(tableName: 'credit_prediction') {
    updateTable = CreditPredictionUpdateTable(this);
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    riskProbability = _i1.ColumnDouble(
      'riskProbability',
      this,
    );
    simulatedScore = _i1.ColumnInt(
      'simulatedScore',
      this,
    );
    scoreBand = _i1.ColumnString(
      'scoreBand',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final CreditPredictionUpdateTable updateTable;

  late final _i1.ColumnInt userId;

  late final _i1.ColumnDouble riskProbability;

  late final _i1.ColumnInt simulatedScore;

  late final _i1.ColumnString scoreBand;

  late final _i1.ColumnDateTime createdAt;

  @override
  List<_i1.Column> get columns => [
    id,
    userId,
    riskProbability,
    simulatedScore,
    scoreBand,
    createdAt,
  ];
}

class CreditPredictionInclude extends _i1.IncludeObject {
  CreditPredictionInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => CreditPrediction.t;
}

class CreditPredictionIncludeList extends _i1.IncludeList {
  CreditPredictionIncludeList._({
    _i1.WhereExpressionBuilder<CreditPredictionTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(CreditPrediction.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => CreditPrediction.t;
}

class CreditPredictionRepository {
  const CreditPredictionRepository._();

  /// Returns a list of [CreditPrediction]s matching the given query parameters.
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
  Future<List<CreditPrediction>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CreditPredictionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CreditPredictionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CreditPredictionTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<CreditPrediction>(
      where: where?.call(CreditPrediction.t),
      orderBy: orderBy?.call(CreditPrediction.t),
      orderByList: orderByList?.call(CreditPrediction.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [CreditPrediction] matching the given query parameters.
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
  Future<CreditPrediction?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CreditPredictionTable>? where,
    int? offset,
    _i1.OrderByBuilder<CreditPredictionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CreditPredictionTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<CreditPrediction>(
      where: where?.call(CreditPrediction.t),
      orderBy: orderBy?.call(CreditPrediction.t),
      orderByList: orderByList?.call(CreditPrediction.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [CreditPrediction] by its [id] or null if no such row exists.
  Future<CreditPrediction?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<CreditPrediction>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [CreditPrediction]s in the list and returns the inserted rows.
  ///
  /// The returned [CreditPrediction]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<CreditPrediction>> insert(
    _i1.Session session,
    List<CreditPrediction> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<CreditPrediction>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [CreditPrediction] and returns the inserted row.
  ///
  /// The returned [CreditPrediction] will have its `id` field set.
  Future<CreditPrediction> insertRow(
    _i1.Session session,
    CreditPrediction row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<CreditPrediction>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [CreditPrediction]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<CreditPrediction>> update(
    _i1.Session session,
    List<CreditPrediction> rows, {
    _i1.ColumnSelections<CreditPredictionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<CreditPrediction>(
      rows,
      columns: columns?.call(CreditPrediction.t),
      transaction: transaction,
    );
  }

  /// Updates a single [CreditPrediction]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<CreditPrediction> updateRow(
    _i1.Session session,
    CreditPrediction row, {
    _i1.ColumnSelections<CreditPredictionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<CreditPrediction>(
      row,
      columns: columns?.call(CreditPrediction.t),
      transaction: transaction,
    );
  }

  /// Updates a single [CreditPrediction] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<CreditPrediction?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<CreditPredictionUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<CreditPrediction>(
      id,
      columnValues: columnValues(CreditPrediction.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [CreditPrediction]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<CreditPrediction>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<CreditPredictionUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<CreditPredictionTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CreditPredictionTable>? orderBy,
    _i1.OrderByListBuilder<CreditPredictionTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<CreditPrediction>(
      columnValues: columnValues(CreditPrediction.t.updateTable),
      where: where(CreditPrediction.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CreditPrediction.t),
      orderByList: orderByList?.call(CreditPrediction.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [CreditPrediction]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<CreditPrediction>> delete(
    _i1.Session session,
    List<CreditPrediction> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<CreditPrediction>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [CreditPrediction].
  Future<CreditPrediction> deleteRow(
    _i1.Session session,
    CreditPrediction row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<CreditPrediction>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<CreditPrediction>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<CreditPredictionTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<CreditPrediction>(
      where: where(CreditPrediction.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CreditPredictionTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<CreditPrediction>(
      where: where?.call(CreditPrediction.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
