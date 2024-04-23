// ignore_for_file: unnecessary_import, depend_on_referenced_packages

import 'package:path/path.dart';
import 'package:projeto_sa2_user_login_register/Model/modelUser.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DatabaseHelper {
  static const String DATABASE_NAME = 'users.db';
  static const String TABLE_NAME = 'users';
  static const String CREATE_CONSTACTS_TABLE_SCRIPT =
      "CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, email TEXT, password TEXT)";

  Future<Database> _getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), DATABASE_NAME),
      // Caminho do banco de dados
      onCreate: (db, version) {
        return db.execute(CREATE_CONSTACTS_TABLE_SCRIPT);
        // Executa o script de criação da tabela quando o banco é criado
      },
      version: 1,
    );
  }

  // Método para criar um novo contato no banco de dados
  Future<void> create(modelUser model) async {
    try {
      final Database db = await _getDatabase();
      await db.insert(
        TABLE_NAME,
        {
          'id': null,
          'name': model.name,
          'email': model.email,
          'password': model.password,
        },
      ); // Insere o contato no banco de dados
    } catch (ex) {
      print(ex);
      return;
    }
  }

  // Método para obter todos os contatos do banco de dados
  Future<List<modelUser>> getUsers() async {
    try {
      final Database db = await _getDatabase();
      final List<Map<String, dynamic>> maps =
          await db.query(TABLE_NAME); // Consulta todos os contatos na tabela

      return List.generate(
        maps.length,
        (i) {
          return modelUser.fromMap(maps[
              i]); // Converte os resultados da consulta para objetos modelUsers
        },
      );
    } catch (ex) {
      print(ex);
      return [];
    }
  }

  Future<modelUser?> getUserByUsername(String username) async {
    final db = await _getDatabase();
    final results = await db.query(
      TABLE_NAME,
      where: 'name = ?',
      whereArgs: [username],
    );

    if (results.isNotEmpty) {
      return modelUser.fromMap(results.first);
    } else {
      return null;
    }
  }
}
