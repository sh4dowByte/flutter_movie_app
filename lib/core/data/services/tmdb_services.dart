import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_movie_app/features/settings/presentation/notifiers/adult_notifier.dart';
import 'package:flutter_movie_app/features/settings/presentation/notifiers/language_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TMDBService {
  late Dio dio;
  final Ref ref;

  TMDBService(this.ref) {
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
      onRequest: (options, handler) {
        // Ambil nilai language dari Riverpod
        final language = ref.read(languageProvider);
        final isAdult = ref.read(isAdultProvider);
        options.queryParameters
            .addAll({'language': language, 'include_adult': isAdult});
        return handler.next(options); // Lanjutkan request
      },
    ));
  }
}
