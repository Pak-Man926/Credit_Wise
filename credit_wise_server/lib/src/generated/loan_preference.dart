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

abstract class LoanPreference
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  LoanPreference._({
    this.id,
    this.userId,
    required this.loanAmount,
    required this.repaymentPeriod,
    required this.repaymentHistory,
    required this.employmentType,
  });

  factory LoanPreference({
    int? id,
    int? userId,
    required double loanAmount,
    required int repaymentPeriod,
    required double repaymentHistory,
    required String employmentType,
  }) = _LoanPreferenceImpl;

  factory LoanPreference.fromJson(Map<String, dynamic> jsonSerialization) {
    return LoanPreference(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int?,
      loanAmount: (jsonSerialization['loanAmount'] as num).toDouble(),
      repaymentPeriod: jsonSerialization['repaymentPeriod'] as int,
      repaymentHistory: (jsonSerialization['repaymentHistory'] as num)
          .toDouble(),
      employmentType: jsonSerialization['employmentType'] as String,
    );
  }

  static final t = LoanPreferenceTable();

  static const db = LoanPreferenceRepository._();

  @override
  int? id;

  int? userId;

  double loanAmount;

  int repaymentPeriod;

  double repaymentHistory;

  String employmentType;

  @override
  _i1.Table<int?> get table => t;

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
      if (userId != null) 'userId': userId,
      'loanAmount': loanAmount,
      'repaymentPeriod': repaymentPeriod,
      'repaymentHistory': repaymentHistory,
      'employmentType': employmentType,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'LoanPreference',
      if (id != null) 'id': id,
      if (userId != null) 'userId': userId,
      'loanAmount': loanAmount,
      'repaymentPeriod': repaymentPeriod,
      'repaymentHistory': repaymentHistory,
      'employmentType': employmentType,
    };
  }

  static LoanPreferenceInclude include() {
    return LoanPreferenceInclude._();
  }

  static LoanPreferenceIncludeList includeList({
    _i1.WhereExpressionBuilder<LoanPreferenceTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<LoanPreferenceTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<LoanPreferenceTable>? orderByList,
    LoanPreferenceInclude? include,
  }) {
    return LoanPreferenceIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(LoanPreference.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(LoanPreference.t),
      include: include,
    );
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
    int? userId,
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
    Object? userId = _Undefined,
    double? loanAmount,
    int? repaymentPeriod,
    double? repaymentHistory,
    String? employmentType,
  }) {
    return LoanPreference(
      id: id is int? ? id : this.id,
      userId: userId is int? ? userId : this.userId,
      loanAmount: loanAmount ?? this.loanAmount,
      repaymentPeriod: repaymentPeriod ?? this.repaymentPeriod,
      repaymentHistory: repaymentHistory ?? this.repaymentHistory,
      employmentType: employmentType ?? this.employmentType,
    );
  }
}

class LoanPreferenceUpdateTable extends _i1.UpdateTable<LoanPreferenceTable> {
  LoanPreferenceUpdateTable(super.table);

  _i1.ColumnValue<int, int> userId(int? value) => _i1.ColumnValue(
    table.userId,
    value,
  );

  _i1.ColumnValue<double, double> loanAmount(double value) => _i1.ColumnValue(
    table.loanAmount,
    value,
  );

  _i1.ColumnValue<int, int> repaymentPeriod(int value) => _i1.ColumnValue(
    table.repaymentPeriod,
    value,
  );

  _i1.ColumnValue<double, double> repaymentHistory(double value) =>
      _i1.ColumnValue(
        table.repaymentHistory,
        value,
      );

  _i1.ColumnValue<String, String> employmentType(String value) =>
      _i1.ColumnValue(
        table.employmentType,
        value,
      );
}

class LoanPreferenceTable extends _i1.Table<int?> {
  LoanPreferenceTable({super.tableRelation})
    : super(tableName: 'loan_preference') {
    updateTable = LoanPreferenceUpdateTable(this);
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    loanAmount = _i1.ColumnDouble(
      'loanAmount',
      this,
    );
    repaymentPeriod = _i1.ColumnInt(
      'repaymentPeriod',
      this,
    );
    repaymentHistory = _i1.ColumnDouble(
      'repaymentHistory',
      this,
    );
    employmentType = _i1.ColumnString(
      'employmentType',
      this,
    );
  }

  late final LoanPreferenceUpdateTable updateTable;

  late final _i1.ColumnInt userId;

  late final _i1.ColumnDouble loanAmount;

  late final _i1.ColumnInt repaymentPeriod;

  late final _i1.ColumnDouble repaymentHistory;

  late final _i1.ColumnString employmentType;

  @override
  List<_i1.Column> get columns => [
    id,
    userId,
    loanAmount,
    repaymentPeriod,
    repaymentHistory,
    employmentType,
  ];
}

class LoanPreferenceInclude extends _i1.IncludeObject {
  LoanPreferenceInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => LoanPreference.t;
}

class LoanPreferenceIncludeList extends _i1.IncludeList {
  LoanPreferenceIncludeList._({
    _i1.WhereExpressionBuilder<LoanPreferenceTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(LoanPreference.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => LoanPreference.t;
}

class LoanPreferenceRepository {
  const LoanPreferenceRepository._();

  /// Returns a list of [LoanPreference]s matching the given query parameters.
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
  Future<List<LoanPreference>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<LoanPreferenceTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<LoanPreferenceTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<LoanPreferenceTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<LoanPreference>(
      where: where?.call(LoanPreference.t),
      orderBy: orderBy?.call(LoanPreference.t),
      orderByList: orderByList?.call(LoanPreference.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [LoanPreference] matching the given query parameters.
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
  Future<LoanPreference?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<LoanPreferenceTable>? where,
    int? offset,
    _i1.OrderByBuilder<LoanPreferenceTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<LoanPreferenceTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<LoanPreference>(
      where: where?.call(LoanPreference.t),
      orderBy: orderBy?.call(LoanPreference.t),
      orderByList: orderByList?.call(LoanPreference.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [LoanPreference] by its [id] or null if no such row exists.
  Future<LoanPreference?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<LoanPreference>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [LoanPreference]s in the list and returns the inserted rows.
  ///
  /// The returned [LoanPreference]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<LoanPreference>> insert(
    _i1.Session session,
    List<LoanPreference> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<LoanPreference>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [LoanPreference] and returns the inserted row.
  ///
  /// The returned [LoanPreference] will have its `id` field set.
  Future<LoanPreference> insertRow(
    _i1.Session session,
    LoanPreference row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<LoanPreference>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [LoanPreference]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<LoanPreference>> update(
    _i1.Session session,
    List<LoanPreference> rows, {
    _i1.ColumnSelections<LoanPreferenceTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<LoanPreference>(
      rows,
      columns: columns?.call(LoanPreference.t),
      transaction: transaction,
    );
  }

  /// Updates a single [LoanPreference]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<LoanPreference> updateRow(
    _i1.Session session,
    LoanPreference row, {
    _i1.ColumnSelections<LoanPreferenceTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<LoanPreference>(
      row,
      columns: columns?.call(LoanPreference.t),
      transaction: transaction,
    );
  }

  /// Updates a single [LoanPreference] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<LoanPreference?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<LoanPreferenceUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<LoanPreference>(
      id,
      columnValues: columnValues(LoanPreference.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [LoanPreference]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<LoanPreference>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<LoanPreferenceUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<LoanPreferenceTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<LoanPreferenceTable>? orderBy,
    _i1.OrderByListBuilder<LoanPreferenceTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<LoanPreference>(
      columnValues: columnValues(LoanPreference.t.updateTable),
      where: where(LoanPreference.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(LoanPreference.t),
      orderByList: orderByList?.call(LoanPreference.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [LoanPreference]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<LoanPreference>> delete(
    _i1.Session session,
    List<LoanPreference> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<LoanPreference>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [LoanPreference].
  Future<LoanPreference> deleteRow(
    _i1.Session session,
    LoanPreference row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<LoanPreference>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<LoanPreference>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<LoanPreferenceTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<LoanPreference>(
      where: where(LoanPreference.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<LoanPreferenceTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<LoanPreference>(
      where: where?.call(LoanPreference.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
