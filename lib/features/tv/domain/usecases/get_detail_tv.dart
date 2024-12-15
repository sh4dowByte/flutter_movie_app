// fetch_upcoming_movies.dart
import 'package:dartz/dartz.dart';
import 'package:flutter_movie_app/core/errors/failure.dart';
import 'package:flutter_movie_app/features/tv/data/models/tv_detail.dart';
import 'package:flutter_movie_app/features/tv/domain/repositories/tv_repository.dart';

class GetDetailTv {
  final TvRepository _repository;

  GetDetailTv(this._repository);

  Future<Either<Failure, TvDetail>> call(int seriesId) {
    return _repository.getTvDetail(seriesId);
  }
}
