// fetch_upcoming_movies.dart
import 'package:dartz/dartz.dart';
import 'package:flutter_movie_app/core/errors/failure.dart';
import 'package:flutter_movie_app/features/tv/data/models/tv.dart';
import 'package:flutter_movie_app/features/tv/domain/repositories/tv_repository.dart';

class GetAiringTodayTv {
  final TvRepository _repository;

  GetAiringTodayTv(this._repository);

  Future<Either<Failure, List<Tv>>> call(int page, {String? dateToday}) {
    return _repository.getAiringTodayTv(page, dateToday: dateToday);
  }
}
