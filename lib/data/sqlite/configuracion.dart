// ignore_for_file: avoid_print

import 'dart:io';

import 'package:gore_app/models/configuracion.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class ConfiguracionBack {
  static const databaseName = "ConfiguracionBack.db";
  static const databaseVersion = 1;

  static const table = 'ConfiguracionBack';

  ConfiguracionBack._privateConstructor();
  static final ConfiguracionBack instance =
      ConfiguracionBack._privateConstructor();

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
      await db.execute('''
          CREATE TABLE ConfiguracionBack (
            DNI TEXT PRIMARY KEY,
            foto TEXT
          )
          ''');
    } catch (ex) {
      // Here I want to know what caused exception.
      print('Failed to insert: $ex');
    }
  }

  // Helper methods
  Future<int> insert(ConfiguracionUsuario configuracionUsuario) async {
    int response = 0;
    try {
      Database? db = await instance.database;
      response = await db!.insert(table, configuracionUsuario.toMapForDb());
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

  Future<ConfiguracionUsuario?> getUsuarioConfiguracion() async {
    Database? db = await instance.database;
    List<Map<String, dynamic>> maps = await db!.query("ConfiguracionBack");
    if (maps.isNotEmpty) {
      // if (maps.length > 0) {

      return ConfiguracionUsuario.fromDB(maps.first);
    }
    return null;
  }

  Future<int> update(
      String id, ConfiguracionUsuario configuracionUsuario) async {
    Database? db = await instance.database;
    return await db!.update(table, configuracionUsuario.toMapForDb(),
        where: 'DNI = ?', whereArgs: [id]);
  }
}
