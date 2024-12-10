// fetch_upcoming_movies.dart
import 'package:dartz/dartz.dart';
import 'package:flutter_movie_app/core/errors/failure.dart';
import 'package:flutter_movie_app/features/movie/data/models/actor.dart';
import 'package:flutter_movie_app/features/movie/domain/repositories/movie_repository.dart';

class GetActorDetail {
  final MovieRepository _repository;

  GetActorDetail(this._repository);

  Future<Either<Failure, Actor>> call(int personId) {
    return _repository.getActorDetail(personId);
  }
}
