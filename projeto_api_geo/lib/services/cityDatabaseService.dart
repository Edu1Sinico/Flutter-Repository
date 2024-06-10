// ignore_for_file: avoid_print
import 'package:path/path.dart';
import 'package:projeto_api_geo/model/city.dart';
import 'package:sqflite/sqflite.dart';

class CityDbservice {
  static const String DATABASE_NAME = 'city.db';
  static const String TABLE_NAME = 'city';
  static const String CREATE_TABLE_SCRIPT =
      "CREATE TABLE $TABLE_NAME(name TEXT PRIMARY KEY, favorite BOOLEAN)";

  Future<Database> _openDatabase() async {
    return openDatabase(
      join(
          await getDatabasesPath(), DATABASE_NAME), // Caminho do banco de dados
      onCreate: (db, version) {
        return db.execute(
            CREATE_TABLE_SCRIPT); // Executa o script de criação da tabela quando o banco é criado
      },
      version: 1,
    );
  }

  // Método para criar uma nova cidade no banco de dados
  Future<void> insertCity(City city) async {
    final Database db = await _openDatabase();
    try {
      db.insert(TABLE_NAME, city.toMap()); // Insere o contato no banco de dados
    } catch (ex) {
      print(ex);
    } finally {
      db.close();
    }
  }

  // Método para obter todos as cidade do banco de dados
  Future<List<Map<String, dynamic>>> listCity() async {
    final Database db = await _openDatabase();
    try {
      List<Map<String, dynamic>> maps = await db.query(TABLE_NAME);
      return maps;
    } catch (ex) {
      print(ex);
      return [];
    } finally {
      db.close();
    }
  }

  // Método para deletar uma cidade do banco de dados
  Future<void> deleteCity(String city) async {
    Database db = await _openDatabase();
    try {
      db.delete(TABLE_NAME, where: 'name = ?', whereArgs: [city]);
    } catch (ex) {
      print(ex);
    } finally {
      db.close();
    }
  }

  // Método para atualizar uma cidade no banco de dados
  Future<void> updateCity(City city) async {
    Database db = await _openDatabase();
    try {
      db.update(TABLE_NAME, city.toMap(),
          where: 'name = ?', whereArgs: [city.name]);
    } catch (e) {
      print(e);
    } finally {
      db.close();
    }
  }
}
