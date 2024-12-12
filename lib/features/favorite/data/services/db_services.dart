import 'package:flutter_movie_app/features/movie/data/models/movie.dart';
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
    String path = join(await getDatabasesPath(), 'movie3.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
     CREATE TABLE fav_movie (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,                
        poster_path TEXT NULL,           
        backdrop_path TEXT NULL,         
        original_language TEXT NOT NULL,   
        original_title TEXT NOT NULL,     
        overview TEXT NOT NULL,            
        popularity DOUBLE NULL,        
        release_date TEXT NOT NULL,         
        vote_average DOUBLE NOT NULL,       
        vote_count INTEGER NOT NULL       
      )
    ''');
  }

  // CRUD Operations
  Future<int> insertFavoriteMovie(Movie movie) async {
    final db = await database;
    return await db.insert('fav_movie', movie.toMapForFavorite());
  }

  Future<List<Movie>> getFavoriteMovie() async {
    final db = await database;
    final data = await db.query('fav_movie');
    return data.map((data) => Movie.fromMap(data)).toList();
  }

  Future<int> deleteFavoriteMovie(int id) async {
    final db = await database;
    return await db.delete(
      'fav_movie',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
