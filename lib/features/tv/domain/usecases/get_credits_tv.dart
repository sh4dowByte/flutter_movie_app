// fetch_upcoming_movies.dart
import 'package:dartz/dartz.dart';
import 'package:flutter_movie_app/core/errors/failure.dart';
import 'package:flutter_movie_app/features/people/data/models/tv_credits.dart';
import 'package:flutter_movie_app/features/tv/domain/repositories/tv_repository.dart';

class GetCreditsTv {
  final TvRepository _repository;

  GetCreditsTv(this._repository);

  Future<Either<Failure, TvCredits>> call(int seriesId) {
    return _repository.getTvCredits(seriesId);
  }
}
