import 'package:flutter_movie_app/core/errors/failure.dart';
import 'package:flutter_movie_app/features/movie/data/models/movie.dart';
import 'package:flutter_movie_app/features/people/data/models/actor.dart';
import 'package:flutter_movie_app/features/people/data/services/people_services.dart';

import '../../domain/repositories/people_repository.dart';
import 'package:dartz/dartz.dart';

class PeopleRepositoryImpl implements PeopleRepository {
  final PeopleService _peopleService;

  PeopleRepositoryImpl(this._peopleService);

  @override
  Future<Either<Failure, List<Movie>>> getActorMovies(int personId) async {
    try {
      final movies = await _peopleService.fetchActorMovies(personId);

      return Right(movies);
    } catch (e) {
      return Left(NetworkFailure('Failed to load actor movie.'));
    }
  }

  @override
  Future<Either<Failure, Actor>> getActorDetail(int personId) async {
    try {
      final movies = await _peopleService.fetchActorDetail(personId);

      return Right(movies);
    } catch (e) {
      return Left(NetworkFailure(e.toString()));
    }
  }
}
