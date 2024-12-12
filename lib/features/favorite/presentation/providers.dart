import 'package:flutter_movie_app/features/favorite/data/repositories/movie_favorite_repository_impl.dart';
import 'package:flutter_movie_app/features/favorite/data/services/db_services.dart';
import 'package:flutter_movie_app/features/favorite/domain/repositories/movie_favorite_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final serviceProvider = Provider((ref) => DBService());

final repositoryProvider = Provider<MovieFavoriteRepository>(
  (ref) => MovieFavoriteRepositoryImpl(ref.watch(serviceProvider)),
);
