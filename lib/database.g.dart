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
      version: 2,
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
            'CREATE TABLE IF NOT EXISTS `MeasureType` (`id` INTEGER, `uuid` TEXT, `title` TEXT, `createdAt` INTEGER, `changedAt` INTEGER, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `measure` (`id` INTEGER, `uuid` TEXT, `value` REAL, `createdAt` INTEGER, `changedAt` INTEGER, `measure_type_id` INTEGER, `channel_id` INTEGER, FOREIGN KEY (`measure_type_id`) REFERENCES `MeasureType` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, FOREIGN KEY (`channel_id`) REFERENCES `Channel` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Channel` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `uuid` TEXT, `title` TEXT, `createdAt` INTEGER, `changedAt` INTEGER)');
        await database.execute(
            'CREATE INDEX `index_measure_channel_id` ON `measure` (`channel_id`)');

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
      : _queryAdapter = QueryAdapter(database, changeListener),
        _measureTypeInsertionAdapter = InsertionAdapter(
            database,
            'MeasureType',
                (MeasureType item) =>
            <String, dynamic>{
              'id': item.id,
              'uuid': item.uuid,
              'title': item.title,
              'createdAt': item.createdAt,
              'changedAt': item.changedAt
            },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _measureTypeMapper = (Map<String, dynamic> row) => MeasureType(
      row['id'] as int,
      row['uuid'] as String,
      row['title'] as String,
      row['createdAt'] as int,
      row['changedAt'] as int);

  final InsertionAdapter<MeasureType> _measureTypeInsertionAdapter;

  @override
  Future<List<MeasureType>> findAllMeasureTypes() async {
    return _queryAdapter.queryList('SELECT * FROM measure_type',
        mapper: _measureTypeMapper);
  }

  @override
  Stream<MeasureType> findMeasureTypeById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM measure_type WHERE id = ?',
        arguments: <dynamic>[id],
        tableName: 'MeasureType',
        mapper: _measureTypeMapper);
  }

  @override
  Future<void> insertMeasureType(MeasureType measureType) async {
    await _measureTypeInsertionAdapter.insert(
        measureType, sqflite.ConflictAlgorithm.abort);
  }
}
