import 'package:flutter_movie_app/features/movie/data/repositories/movie_repository_impl.dart';
import 'package:flutter_movie_app/features/movie/data/services/movie_services.dart';
import 'package:flutter_movie_app/features/movie/domain/repositories/movie_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieServiceProvider = Provider((ref) => MovieService());

final movieRepositoryProvider = Provider<MovieRepository>(
  (ref) => MovieRepositoryImpl(ref.watch(movieServiceProvider)),
);
