import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_movie_app/core/utils/storage/local_storage.dart';

class TMDBService {
  late Dio dio;

  TMDBService() {
    dio = Dio(
      BaseOptions(
        baseUrl: dotenv.env['TMDB_API_BASE_URL']!,
        headers: {
          'Authorization': 'Bearer ${dotenv.env['TMDB_ACCESS_TOKEN']}',
          'Content-Type': 'application/json;charset=utf-8',
        },
      ),
    );

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final noLanguage = options.extra['noLanguage'] ?? false;

        if (!noLanguage) {
          // Ambil nilai language dari Riverpod
          final language = await LocalStorageUtils.getLanguage();
          final isAdult = await LocalStorageUtils.getIsAdult();
          options.queryParameters
              .addAll({'language': language, 'include_adult': isAdult});
        }

        return handler.next(options); // Lanjutkan request
      },
    ));
  }
}
