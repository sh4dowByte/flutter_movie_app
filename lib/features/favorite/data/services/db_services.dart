import 'package:flutter_movie_app/features/favorite/data/models/favorite.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBService {
  static final DBService _instance = DBService._internal();
  factory DBService() => _instance;

  DBService._internal();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'favorite.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
     CREATE TABLE favorite (
        fav_id INTEGER PRIMARY KEY AUTOINCREMENT,
        id INTEGER NOT NULL,
        title TEXT NOT NULL,                
        poster_path TEXT NULL,           
        backdrop_path TEXT NULL,         
        overview TEXT NOT NULL,            
        popularity DOUBLE NULL,        
        date TEXT NOT NULL,         
        vote_average DOUBLE NOT NULL,       
        type TEXT NOT NULL,       
        vote_count INTEGER NOT NULL       
      )
    ''');
  }

  // Insert a favorite
  Future<int> insertFavorite(Favorite fav) async {
    final db = await database;
    return await db.insert('favorite', fav.toMap());
  }

  // Retrieve all favorite movies
  Future<List<Favorite>> getFavoriteMovie() async {
    final db = await database;
    final List<Map<String, dynamic>> data =
        await db.query('favorite', where: 'type = ?', whereArgs: ['movie']);
    return data.map((map) => Favorite.fromMap(map)).toList();
  }

  // Delete a favorite movie
  Future<int> deleteFavoriteMovie(int id) async {
    final db = await database;
    return await db.delete(
      'favorite',
      where: 'id = ? AND type = ?',
      whereArgs: [id, 'movie'],
    );
  }

  // Retrieve all favorite series
  Future<List<Favorite>> getFavoriteSeries() async {
    final db = await database;
    final List<Map<String, dynamic>> data =
        await db.query('favorite', where: 'type = ?', whereArgs: ['series']);
    return data.map((map) => Favorite.fromMap(map)).toList();
  }

  // Delete a favorite series
  Future<int> deleteFavoriteSeries(int id) async {
    final db = await database;
    return await db.delete(
      'favorite',
      where: 'id = ? AND type = ?',
      whereArgs: [id, 'series'],
    );
  }
}
