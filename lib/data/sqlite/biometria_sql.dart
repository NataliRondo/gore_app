// ignore_for_file: avoid_print, file_names

import 'dart:io';
import 'package:gore_app/models/biometria_sql.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class BiometriaSQL {
  static const databaseName = "biometria.db";
  static const databaseVersion = 1;

  static const table = 'Biometria';

  BiometriaSQL._privateConstructor();
  static final BiometriaSQL instance = BiometriaSQL._privateConstructor();

  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = "";
    try {
      path = join(documentsDirectory.path, databaseName);
    } catch (ex) {
      // Here I want to know what caused exception.
      print('Failed to insert: $ex');
    }
    try {
      Database oDB = await openDatabase(path,
          version: databaseVersion, onCreate: _onCreate);
      return oDB;
    } catch (ex) {
      // Here I want to know what caused exception.
      print('Failed to insert: $ex');
    }
  }

  Future _onCreate(Database db, int version) async {
    try {
      await
          /*db.execute('''
          CREATE TABLE $table (
            DNI TEXT PRIMARY KEY,
            password TEXT
          )
          ''');*/
          db.execute(
              'CREATE TABLE $table (DNI TEXT PRIMARY KEY, password TEXT)');
    } catch (ex) {
      // Here I want to know what caused exception.
      print('Failed to insert: $ex');
    }
  }

  // Helper methods
  Future<int> insert(Biometriasql biometriaSQL) async {
    int response = 0;
    try {
      Database? db = await instance.database;
      response = await db!.insert(table, biometriaSQL.toMapForDb());
    } catch (ex) {
      // Here I want to know what caused exception.
      print('Failed to insert: $ex');
    }
    return response;
  }

  Future<int?> queryRowCount() async {
    Database? db = await instance.database;
    return Sqflite.firstIntValue(
        await db!.rawQuery('SELECT COUNT(*) FROM $table'));
  }

  Future<Biometriasql?> getUsuarioBio() async {
    Database? db = await instance.database;
    List<Map<String, dynamic>> maps = await db!.query(table);
    if (maps.isNotEmpty) {
      // if (maps.length > 0) {

      return Biometriasql.fromDB(maps.first);
    }
    return null;
  }

  Future<int> delete(String id) async {
    Database? db = await instance.database;
    return await db!.delete(table, where: 'DNI = ?', whereArgs: [id]);
  }

  Future<int> update(String id, Biometriasql biometriaSQL) async {
    Database? db = await instance.database;
    return await db!.update(table, biometriaSQL.toMapForDb(),
        where: 'DNI = ?', whereArgs: [id]);
  }

  Future cerrarSesion() async {
    Database? db = await instance.database;
    await db!.close();
  }
}
