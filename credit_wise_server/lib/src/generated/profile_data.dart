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

abstract class ProfileData
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = ProfileDataTable();

  static const db = ProfileDataRepository._();

  @override
  int? id;

  int userId;

  int age;

  int dependants;

  double monthlyIncome;

  double debtRatio;

  double contributorIncome;

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
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

  static ProfileDataInclude include() {
    return ProfileDataInclude._();
  }

  static ProfileDataIncludeList includeList({
    _i1.WhereExpressionBuilder<ProfileDataTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProfileDataTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProfileDataTable>? orderByList,
    ProfileDataInclude? include,
  }) {
    return ProfileDataIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ProfileData.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ProfileData.t),
      include: include,
    );
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

class ProfileDataUpdateTable extends _i1.UpdateTable<ProfileDataTable> {
  ProfileDataUpdateTable(super.table);

  _i1.ColumnValue<int, int> userId(int value) => _i1.ColumnValue(
    table.userId,
    value,
  );

  _i1.ColumnValue<int, int> age(int value) => _i1.ColumnValue(
    table.age,
    value,
  );

  _i1.ColumnValue<int, int> dependants(int value) => _i1.ColumnValue(
    table.dependants,
    value,
  );

  _i1.ColumnValue<double, double> monthlyIncome(double value) =>
      _i1.ColumnValue(
        table.monthlyIncome,
        value,
      );

  _i1.ColumnValue<double, double> debtRatio(double value) => _i1.ColumnValue(
    table.debtRatio,
    value,
  );

  _i1.ColumnValue<double, double> contributorIncome(double value) =>
      _i1.ColumnValue(
        table.contributorIncome,
        value,
      );
}

class ProfileDataTable extends _i1.Table<int?> {
  ProfileDataTable({super.tableRelation}) : super(tableName: 'profile_data') {
    updateTable = ProfileDataUpdateTable(this);
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    age = _i1.ColumnInt(
      'age',
      this,
    );
    dependants = _i1.ColumnInt(
      'dependants',
      this,
    );
    monthlyIncome = _i1.ColumnDouble(
      'monthlyIncome',
      this,
    );
    debtRatio = _i1.ColumnDouble(
      'debtRatio',
      this,
    );
    contributorIncome = _i1.ColumnDouble(
      'contributorIncome',
      this,
    );
  }

  late final ProfileDataUpdateTable updateTable;

  late final _i1.ColumnInt userId;

  late final _i1.ColumnInt age;

  late final _i1.ColumnInt dependants;

  late final _i1.ColumnDouble monthlyIncome;

  late final _i1.ColumnDouble debtRatio;

  late final _i1.ColumnDouble contributorIncome;

  @override
  List<_i1.Column> get columns => [
    id,
    userId,
    age,
    dependants,
    monthlyIncome,
    debtRatio,
    contributorIncome,
  ];
}

class ProfileDataInclude extends _i1.IncludeObject {
  ProfileDataInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => ProfileData.t;
}

class ProfileDataIncludeList extends _i1.IncludeList {
  ProfileDataIncludeList._({
    _i1.WhereExpressionBuilder<ProfileDataTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ProfileData.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => ProfileData.t;
}

class ProfileDataRepository {
  const ProfileDataRepository._();

  /// Returns a list of [ProfileData]s matching the given query parameters.
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
  Future<List<ProfileData>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProfileDataTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProfileDataTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProfileDataTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<ProfileData>(
      where: where?.call(ProfileData.t),
      orderBy: orderBy?.call(ProfileData.t),
      orderByList: orderByList?.call(ProfileData.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [ProfileData] matching the given query parameters.
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
  Future<ProfileData?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProfileDataTable>? where,
    int? offset,
    _i1.OrderByBuilder<ProfileDataTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProfileDataTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<ProfileData>(
      where: where?.call(ProfileData.t),
      orderBy: orderBy?.call(ProfileData.t),
      orderByList: orderByList?.call(ProfileData.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [ProfileData] by its [id] or null if no such row exists.
  Future<ProfileData?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<ProfileData>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [ProfileData]s in the list and returns the inserted rows.
  ///
  /// The returned [ProfileData]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<ProfileData>> insert(
    _i1.Session session,
    List<ProfileData> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<ProfileData>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [ProfileData] and returns the inserted row.
  ///
  /// The returned [ProfileData] will have its `id` field set.
  Future<ProfileData> insertRow(
    _i1.Session session,
    ProfileData row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ProfileData>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [ProfileData]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<ProfileData>> update(
    _i1.Session session,
    List<ProfileData> rows, {
    _i1.ColumnSelections<ProfileDataTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<ProfileData>(
      rows,
      columns: columns?.call(ProfileData.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ProfileData]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ProfileData> updateRow(
    _i1.Session session,
    ProfileData row, {
    _i1.ColumnSelections<ProfileDataTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<ProfileData>(
      row,
      columns: columns?.call(ProfileData.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ProfileData] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<ProfileData?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<ProfileDataUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<ProfileData>(
      id,
      columnValues: columnValues(ProfileData.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [ProfileData]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<ProfileData>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<ProfileDataUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<ProfileDataTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProfileDataTable>? orderBy,
    _i1.OrderByListBuilder<ProfileDataTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<ProfileData>(
      columnValues: columnValues(ProfileData.t.updateTable),
      where: where(ProfileData.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ProfileData.t),
      orderByList: orderByList?.call(ProfileData.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [ProfileData]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<ProfileData>> delete(
    _i1.Session session,
    List<ProfileData> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ProfileData>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [ProfileData].
  Future<ProfileData> deleteRow(
    _i1.Session session,
    ProfileData row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ProfileData>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<ProfileData>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ProfileDataTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<ProfileData>(
      where: where(ProfileData.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProfileDataTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ProfileData>(
      where: where?.call(ProfileData.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
