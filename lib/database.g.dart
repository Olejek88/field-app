// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? join(await sqflite.getDatabasesPath(), name)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  MeasureTypeDao _measureTypeDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback callback]) async {
    return sqflite.openDatabase(
      path,
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `MeasureType` (`_id` INTEGER, `uuid` TEXT, `title` TEXT, `createdAt` INTEGER, `changedAt` INTEGER, PRIMARY KEY (`_id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
  }

  @override
  MeasureTypeDao get measureTypeDao {
    return _measureTypeDaoInstance ??=
        _$MeasureTypeDao(database, changeListener);
  }
}

class _$MeasureTypeDao extends MeasureTypeDao {
  _$MeasureTypeDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _measureTypeMapper = (Map<String, dynamic> row) => MeasureType(
      row['_id'] as int,
      row['uuid'] as String,
      row['title'] as String,
      row['createdAt'] as int,
      row['changedAt'] as int);

  @override
  Future<List<MeasureType>> findAllPersons() async {
    return _queryAdapter.queryList('SELECT * FROM measure_type',
        mapper: _measureTypeMapper);
  }

  @override
  Stream<MeasureType> findPersonById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM measure_type WHERE _id = ?',
        arguments: <dynamic>[id],
        tableName: 'MeasureType',
        mapper: _measureTypeMapper);
  }
}
