/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class Users implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Users._({
    this.id,
    required this.fisrtName,
    required this.secondName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.createdAt,
  });

  factory Users({
    int? id,
    required String fisrtName,
    required String secondName,
    required String lastName,
    required String email,
    required int phoneNumber,
    required String password,
    required DateTime createdAt,
  }) = _UsersImpl;

  factory Users.fromJson(Map<String, dynamic> jsonSerialization) {
    return Users(
      id: jsonSerialization['id'] as int?,
      fisrtName: jsonSerialization['fisrtName'] as String,
      secondName: jsonSerialization['secondName'] as String,
      lastName: jsonSerialization['lastName'] as String,
      email: jsonSerialization['email'] as String,
      phoneNumber: jsonSerialization['phoneNumber'] as int,
      password: jsonSerialization['password'] as String,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  static final t = UsersTable();

  static const db = UsersRepository._();

  @override
  int? id;

  String fisrtName;

  String secondName;

  String lastName;

  String email;

  int phoneNumber;

  String password;

  DateTime createdAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Users]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Users copyWith({
    int? id,
    String? fisrtName,
    String? secondName,
    String? lastName,
    String? email,
    int? phoneNumber,
    String? password,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'fisrtName': fisrtName,
      'secondName': secondName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'password': password,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'fisrtName': fisrtName,
      'secondName': secondName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'password': password,
      'createdAt': createdAt.toJson(),
    };
  }

  static UsersInclude include() {
    return UsersInclude._();
  }

  static UsersIncludeList includeList({
    _i1.WhereExpressionBuilder<UsersTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UsersTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UsersTable>? orderByList,
    UsersInclude? include,
  }) {
    return UsersIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Users.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Users.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UsersImpl extends Users {
  _UsersImpl({
    int? id,
    required String fisrtName,
    required String secondName,
    required String lastName,
    required String email,
    required int phoneNumber,
    required String password,
    required DateTime createdAt,
  }) : super._(
          id: id,
          fisrtName: fisrtName,
          secondName: secondName,
          lastName: lastName,
          email: email,
          phoneNumber: phoneNumber,
          password: password,
          createdAt: createdAt,
        );

  /// Returns a shallow copy of this [Users]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Users copyWith({
    Object? id = _Undefined,
    String? fisrtName,
    String? secondName,
    String? lastName,
    String? email,
    int? phoneNumber,
    String? password,
    DateTime? createdAt,
  }) {
    return Users(
      id: id is int? ? id : this.id,
      fisrtName: fisrtName ?? this.fisrtName,
      secondName: secondName ?? this.secondName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class UsersTable extends _i1.Table<int?> {
  UsersTable({super.tableRelation}) : super(tableName: 'auth_user') {
    fisrtName = _i1.ColumnString(
      'fisrtName',
      this,
    );
    secondName = _i1.ColumnString(
      'secondName',
      this,
    );
    lastName = _i1.ColumnString(
      'lastName',
      this,
    );
    email = _i1.ColumnString(
      'email',
      this,
    );
    phoneNumber = _i1.ColumnInt(
      'phoneNumber',
      this,
    );
    password = _i1.ColumnString(
      'password',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final _i1.ColumnString fisrtName;

  late final _i1.ColumnString secondName;

  late final _i1.ColumnString lastName;

  late final _i1.ColumnString email;

  late final _i1.ColumnInt phoneNumber;

  late final _i1.ColumnString password;

  late final _i1.ColumnDateTime createdAt;

  @override
  List<_i1.Column> get columns => [
        id,
        fisrtName,
        secondName,
        lastName,
        email,
        phoneNumber,
        password,
        createdAt,
      ];
}

class UsersInclude extends _i1.IncludeObject {
  UsersInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Users.t;
}

class UsersIncludeList extends _i1.IncludeList {
  UsersIncludeList._({
    _i1.WhereExpressionBuilder<UsersTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Users.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Users.t;
}

class UsersRepository {
  const UsersRepository._();

  /// Returns a list of [Users]s matching the given query parameters.
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
  Future<List<Users>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UsersTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UsersTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UsersTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Users>(
      where: where?.call(Users.t),
      orderBy: orderBy?.call(Users.t),
      orderByList: orderByList?.call(Users.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Users] matching the given query parameters.
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
  Future<Users?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UsersTable>? where,
    int? offset,
    _i1.OrderByBuilder<UsersTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UsersTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Users>(
      where: where?.call(Users.t),
      orderBy: orderBy?.call(Users.t),
      orderByList: orderByList?.call(Users.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Users] by its [id] or null if no such row exists.
  Future<Users?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Users>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Users]s in the list and returns the inserted rows.
  ///
  /// The returned [Users]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Users>> insert(
    _i1.Session session,
    List<Users> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Users>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Users] and returns the inserted row.
  ///
  /// The returned [Users] will have its `id` field set.
  Future<Users> insertRow(
    _i1.Session session,
    Users row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Users>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Users]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Users>> update(
    _i1.Session session,
    List<Users> rows, {
    _i1.ColumnSelections<UsersTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Users>(
      rows,
      columns: columns?.call(Users.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Users]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Users> updateRow(
    _i1.Session session,
    Users row, {
    _i1.ColumnSelections<UsersTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Users>(
      row,
      columns: columns?.call(Users.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Users]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Users>> delete(
    _i1.Session session,
    List<Users> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Users>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Users].
  Future<Users> deleteRow(
    _i1.Session session,
    Users row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Users>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Users>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<UsersTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Users>(
      where: where(Users.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UsersTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Users>(
      where: where?.call(Users.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
