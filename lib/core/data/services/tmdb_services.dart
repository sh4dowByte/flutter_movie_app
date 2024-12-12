import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class TMDBService {
  Dio dio;

  TMDBService()
      : dio = Dio(
          BaseOptions(
            baseUrl: dotenv.env['TMDB_API_BASE_URL']!,
            headers: {
              'Authorization': 'Bearer ${dotenv.env['TMDB_ACCESS_TOKEN']}',
              'Content-Type': 'application/json;charset=utf-8',
            },
          ),
        );
}
