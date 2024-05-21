// ignore_for_file: avoid_print

import 'package:path/path.dart';
import 'package:projeto_api_geo/model/city.dart';
import 'package:sqflite/sqflite.dart';

class ConnectionSQLite {
  static const String DATABASE_NAME = 'city.db';
  static const String TABLE_NAME = 'city';
  static const String CREATE_CONSTACTS_TABLE_SCRIPT =
      "CREATE TABLE city(name TEXT, favorite BOOLEAN)";

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

  // Método para criar uma nova cidade no banco de dados
  Future<void> createCity(City cidade) async {
    try {
      final Database db = await _getDatabase();
      await db.insert(
          TABLE_NAME, cidade.toMap()); // Insere o contato no banco de dados
    } catch (ex) {
      print(ex);
      return;
    }
  }

  // Método para obter todos as cidade do banco de dados
  Future<List<City>> getCities() async {
    try {
      final Database db = await _getDatabase();
      final List<Map<String, dynamic>> maps =
          await db.query(TABLE_NAME); // Consulta todos as cidades na tabela

      return List.generate(
        maps.length,
        (i) {
          return City.fromMap(
              maps[i]); // Converte os resultados da consulta para objetos City
        },
      );
    } catch (ex) {
      print(ex);
      return [];
    }
  }

  // Método para atualizar uma cidade no banco de dados
  Future<void> updateCity(City cidade) async {
    try {
      final Database db = await _getDatabase();
      await db.update(
        TABLE_NAME,
        cidade.toMap(),
        where: "name = ?", // Condição para atualizar a cidade com base no nome
        whereArgs: [cidade.name],
      );
    } catch (ex) {
      print(ex);
      return;
    }
  }
}
