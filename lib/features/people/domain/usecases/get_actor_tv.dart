// fetch_upcoming_movies.dart
import 'package:dartz/dartz.dart';
import 'package:flutter_movie_app/core/errors/failure.dart';
import 'package:flutter_movie_app/features/people/domain/repositories/people_repository.dart';
import 'package:flutter_movie_app/features/tv/data/models/tv.dart';

class GetActorTv {
  final PeopleRepository _repository;

  GetActorTv(this._repository);

  Future<Either<Failure, List<Tv>>> call(int personId) {
    return _repository.getActorTv(personId);
  }
}
