import 'package:flutter_movie_app/core/errors/failure.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter_movie_app/features/people/data/models/actor.dart';
import 'package:flutter_movie_app/features/movie/data/models/movie.dart';

abstract class PeopleRepository {
  Future<Either<Failure, Actor>> getActorDetail(int personId);
  Future<Either<Failure, List<Movie>>> getActorMovies(int personId);
}
