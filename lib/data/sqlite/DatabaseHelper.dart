// ignore_for_file: avoid_print, file_names

import 'dart:io';

import 'package:gore_app/models/UsuarioLite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
   static const databaseName = "GORELaLibertad.db";
   static const databaseVersion = 1;

  static const table = 'Usuario';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

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
          CREATE TABLE Usuario (
            id_usu INTEGER PRIMARY KEY,
            vUsuNick TEXT NOT NULL,
            vUsuContrasenia TEXT NOT NULL,
            vPerNombre TEXT NOT NULL,
            vPerApellidos TEXT NOT NULL,
            foto TEXT NOT NULL,
            DNI TEXT NOT NULL
          )
          ''');
    } catch (ex) {
      // Here I want to know what caused exception.
      print('Failed to insert: $ex');
    }
  }

  Future _update() async {
    Database? db = await instance.database;
    await db!.update("Usuario", );
  }

  // Helper methods
  Future<int> insert(UsuarioLite oUsuarioLite) async {
    int response = 0;
    try {
      Database? db = await instance.database;
      response = await db!.insert(table, oUsuarioLite.toMapForDb());
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

  Future<UsuarioLite?> getUsuario() async {
    Database? db = await instance.database;
    List<Map<String, dynamic>> maps = await db!.query("Usuario");
    if (maps.isNotEmpty) {
   // if (maps.length > 0) {

      return UsuarioLite.fromBD(maps.first);
    }
    return null;
  }
}
