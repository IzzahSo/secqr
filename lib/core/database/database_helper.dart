import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../model/barcode_model.dart';
import '../localization/application_strings.dart';

class DatabaseHelper {
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await initDb();
    return _database;
  }

  /// This function get the path for creating Database by OS type
  Future<Database> initDb() async {
    var dbFolder = await getDatabasesPath();
    // We combine the path and database name on path variable
    var path = join(dbFolder, ApplicationStrings.database);
    return await openDatabase(path, onCreate: _onCreate, version: 1);
  }

  /// Creating table
  FutureOr<void> _onCreate(Database db, int version) async {
    await db.execute(ApplicationStrings.databaseCreateQuery);
  }

  /// Getting datas from the table
  Future<List<BarcodeModel>> get() async {
    var dbClient = await database;
    var result = await dbClient!.query(ApplicationStrings.databaseTable);

    return result.map((e) => BarcodeModel.fromMap(e)).toList();
  }

  /// Inserting data to table
  Future<int> insert(BarcodeModel model) async {
    var dbClient = await database;

    return await dbClient!.insert(ApplicationStrings.databaseTable, model.toMap());
  }

  /// Deleting specific data from the table with id condition
  Future<void> delete(int id) async {
    var dbClient = await database;
    await dbClient!.delete(ApplicationStrings.databaseTable, where: 'id = ? ', whereArgs: [id]);
  }
}
