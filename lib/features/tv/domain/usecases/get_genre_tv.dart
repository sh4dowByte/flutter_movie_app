// fetch_upcoming_movies.dart
import 'package:dartz/dartz.dart';
import 'package:flutter_movie_app/core/errors/failure.dart';
import 'package:flutter_movie_app/core/data/models/genres.dart';
import 'package:flutter_movie_app/features/tv/domain/repositories/tv_repository.dart';

class GetGenreTv {
  final TvRepository _repository;

  GetGenreTv(this._repository);

  Future<Either<Failure, List<Genres>>> call() {
    return _repository.getGenreTv();
  }
}
