import 'package:flutter_movie_app/features/tv/data/repositories/tv_repository_impl.dart';
import 'package:flutter_movie_app/features/tv/data/services/tv_services.dart';
import 'package:flutter_movie_app/features/tv/domain/repositories/tv_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final tvServiceProvider = Provider((ref) => TVService());

final tvRepositoryProvider = Provider<TvRepository>(
  (ref) => TvRepositoryImpl(ref.watch(tvServiceProvider)),
);
