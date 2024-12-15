// fetch_upcoming_movies.dart
import 'package:dartz/dartz.dart';
import 'package:flutter_movie_app/core/errors/failure.dart';
import 'package:flutter_movie_app/features/tv/data/models/tv.dart';
import 'package:flutter_movie_app/features/tv/domain/repositories/tv_repository.dart';

class GetPopularTv {
  final TvRepository _repository;

  GetPopularTv(this._repository);

  Future<Either<Failure, List<Tv>>> call(int page) {
    return _repository.getPopularTv(page);
  }
}
