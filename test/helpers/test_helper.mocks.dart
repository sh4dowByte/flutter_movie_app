// Mocks generated by Mockito 5.4.4 from annotations
// in flutter_movie_app/test/helpers/test_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i7;

import 'package:dartz/dartz.dart' as _i2;
import 'package:dio/dio.dart' as _i3;
import 'package:flutter_movie_app/core/data/models/genres.dart' as _i9;
import 'package:flutter_movie_app/core/errors/failure.dart' as _i8;
import 'package:flutter_movie_app/features/movie/data/models/movie.dart'
    as _i11;
import 'package:flutter_movie_app/core/data/models/movie_clip.dart' as _i10;
import 'package:flutter_movie_app/features/movie/data/models/movie_detail.dart'
    as _i5;
import 'package:flutter_movie_app/features/movie/data/services/movie_services.dart'
    as _i12;
import 'package:flutter_movie_app/features/movie/domain/repositories/movie_repository.dart'
    as _i6;
import 'package:flutter_movie_app/features/people/data/models/cast.dart'
    as _i13;
import 'package:flutter_riverpod/flutter_riverpod.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDio_1 extends _i1.SmartFake implements _i3.Dio {
  _FakeDio_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeRef_2<State extends Object?> extends _i1.SmartFake
    implements _i4.Ref<State> {
  _FakeRef_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeMovieDetail_3 extends _i1.SmartFake implements _i5.MovieDetail {
  _FakeMovieDetail_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [MovieRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieRepository extends _i1.Mock implements _i6.MovieRepository {
  MockMovieRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i9.Genres>>> getGenreMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getGenreMovies,
          [],
        ),
        returnValue:
            _i7.Future<_i2.Either<_i8.Failure, List<_i9.Genres>>>.value(
                _FakeEither_0<_i8.Failure, List<_i9.Genres>>(
          this,
          Invocation.method(
            #getGenreMovies,
            [],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, List<_i9.Genres>>>);

  @override
  _i7.Future<_i2.Either<_i8.Failure, _i5.MovieDetail>> getMovieDetail(
          int? movieId) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMovieDetail,
          [movieId],
        ),
        returnValue: _i7.Future<_i2.Either<_i8.Failure, _i5.MovieDetail>>.value(
            _FakeEither_0<_i8.Failure, _i5.MovieDetail>(
          this,
          Invocation.method(
            #getMovieDetail,
            [movieId],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, _i5.MovieDetail>>);

  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i10.MovieClip>>> getMovieClips(
          int? movieId) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMovieClips,
          [movieId],
        ),
        returnValue:
            _i7.Future<_i2.Either<_i8.Failure, List<_i10.MovieClip>>>.value(
                _FakeEither_0<_i8.Failure, List<_i10.MovieClip>>(
          this,
          Invocation.method(
            #getMovieClips,
            [movieId],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, List<_i10.MovieClip>>>);

  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i11.Movie>>> getUpcomingMovies(
          int? page) =>
      (super.noSuchMethod(
        Invocation.method(
          #getUpcomingMovies,
          [page],
        ),
        returnValue:
            _i7.Future<_i2.Either<_i8.Failure, List<_i11.Movie>>>.value(
                _FakeEither_0<_i8.Failure, List<_i11.Movie>>(
          this,
          Invocation.method(
            #getUpcomingMovies,
            [page],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, List<_i11.Movie>>>);

  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i11.Movie>>> getPopularMovies(
          int? page) =>
      (super.noSuchMethod(
        Invocation.method(
          #getPopularMovies,
          [page],
        ),
        returnValue:
            _i7.Future<_i2.Either<_i8.Failure, List<_i11.Movie>>>.value(
                _FakeEither_0<_i8.Failure, List<_i11.Movie>>(
          this,
          Invocation.method(
            #getPopularMovies,
            [page],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, List<_i11.Movie>>>);

  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i11.Movie>>> getTopRatedMovies(
          int? page) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTopRatedMovies,
          [page],
        ),
        returnValue:
            _i7.Future<_i2.Either<_i8.Failure, List<_i11.Movie>>>.value(
                _FakeEither_0<_i8.Failure, List<_i11.Movie>>(
          this,
          Invocation.method(
            #getTopRatedMovies,
            [page],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, List<_i11.Movie>>>);

  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i11.Movie>>> getNowPlayingMovies(
          int? page) =>
      (super.noSuchMethod(
        Invocation.method(
          #getNowPlayingMovies,
          [page],
        ),
        returnValue:
            _i7.Future<_i2.Either<_i8.Failure, List<_i11.Movie>>>.value(
                _FakeEither_0<_i8.Failure, List<_i11.Movie>>(
          this,
          Invocation.method(
            #getNowPlayingMovies,
            [page],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, List<_i11.Movie>>>);

  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i11.Movie>>> getDiscoverMovies(
    int? page,
    int? genreId,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #getDiscoverMovies,
          [
            page,
            genreId,
          ],
        ),
        returnValue:
            _i7.Future<_i2.Either<_i8.Failure, List<_i11.Movie>>>.value(
                _FakeEither_0<_i8.Failure, List<_i11.Movie>>(
          this,
          Invocation.method(
            #getDiscoverMovies,
            [
              page,
              genreId,
            ],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, List<_i11.Movie>>>);

  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i11.Movie>>> getRecomendedMovies(
    int? page,
    int? movieId,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #getRecomendedMovies,
          [
            page,
            movieId,
          ],
        ),
        returnValue:
            _i7.Future<_i2.Either<_i8.Failure, List<_i11.Movie>>>.value(
                _FakeEither_0<_i8.Failure, List<_i11.Movie>>(
          this,
          Invocation.method(
            #getRecomendedMovies,
            [
              page,
              movieId,
            ],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, List<_i11.Movie>>>);

  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i11.Movie>>> getSearchMovies(
    int? page,
    String? keyword,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #getSearchMovies,
          [
            page,
            keyword,
          ],
        ),
        returnValue:
            _i7.Future<_i2.Either<_i8.Failure, List<_i11.Movie>>>.value(
                _FakeEither_0<_i8.Failure, List<_i11.Movie>>(
          this,
          Invocation.method(
            #getSearchMovies,
            [
              page,
              keyword,
            ],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, List<_i11.Movie>>>);
}

/// A class which mocks [MovieService].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieService extends _i1.Mock implements _i12.MovieService {
  MockMovieService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Dio get dio => (super.noSuchMethod(
        Invocation.getter(#dio),
        returnValue: _FakeDio_1(
          this,
          Invocation.getter(#dio),
        ),
      ) as _i3.Dio);

  @override
  set dio(_i3.Dio? _dio) => super.noSuchMethod(
        Invocation.setter(
          #dio,
          _dio,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i4.Ref<Object?> get ref => (super.noSuchMethod(
        Invocation.getter(#ref),
        returnValue: _FakeRef_2<Object?>(
          this,
          Invocation.getter(#ref),
        ),
      ) as _i4.Ref<Object?>);

  @override
  _i7.Future<List<_i11.Movie>> fetchPopularMovies(int? page) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchPopularMovies,
          [page],
        ),
        returnValue: _i7.Future<List<_i11.Movie>>.value(<_i11.Movie>[]),
      ) as _i7.Future<List<_i11.Movie>>);

  @override
  _i7.Future<List<_i10.MovieClip>> fetchMovieClip(int? movieId) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchMovieClip,
          [movieId],
        ),
        returnValue: _i7.Future<List<_i10.MovieClip>>.value(<_i10.MovieClip>[]),
      ) as _i7.Future<List<_i10.MovieClip>>);

  @override
  _i7.Future<List<_i11.Movie>> fetchTopRatedMovies(int? page) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchTopRatedMovies,
          [page],
        ),
        returnValue: _i7.Future<List<_i11.Movie>>.value(<_i11.Movie>[]),
      ) as _i7.Future<List<_i11.Movie>>);

  @override
  _i7.Future<List<_i11.Movie>> fetchUpcomingMovies(int? page) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchUpcomingMovies,
          [page],
        ),
        returnValue: _i7.Future<List<_i11.Movie>>.value(<_i11.Movie>[]),
      ) as _i7.Future<List<_i11.Movie>>);

  @override
  _i7.Future<List<_i11.Movie>> searchMovies(
    String? keyword, {
    int? page = 1,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchMovies,
          [keyword],
          {#page: page},
        ),
        returnValue: _i7.Future<List<_i11.Movie>>.value(<_i11.Movie>[]),
      ) as _i7.Future<List<_i11.Movie>>);

  @override
  _i7.Future<List<_i11.Movie>> fetchNowPlayingMovies(int? page) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchNowPlayingMovies,
          [page],
        ),
        returnValue: _i7.Future<List<_i11.Movie>>.value(<_i11.Movie>[]),
      ) as _i7.Future<List<_i11.Movie>>);

  @override
  _i7.Future<List<_i11.Movie>> fetchRecommendedMovies(
    dynamic movieId, {
    int? page = 1,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchRecommendedMovies,
          [movieId],
          {#page: page},
        ),
        returnValue: _i7.Future<List<_i11.Movie>>.value(<_i11.Movie>[]),
      ) as _i7.Future<List<_i11.Movie>>);

  @override
  _i7.Future<_i5.MovieDetail> fetchMovieDetails(int? movieId) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchMovieDetails,
          [movieId],
        ),
        returnValue: _i7.Future<_i5.MovieDetail>.value(_FakeMovieDetail_3(
          this,
          Invocation.method(
            #fetchMovieDetails,
            [movieId],
          ),
        )),
      ) as _i7.Future<_i5.MovieDetail>);

  @override
  _i7.Future<List<_i13.Cast>> fetchMovieCaster(int? movieId) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchMovieCaster,
          [movieId],
        ),
        returnValue: _i7.Future<List<_i13.Cast>>.value(<_i13.Cast>[]),
      ) as _i7.Future<List<_i13.Cast>>);

  @override
  _i7.Future<List<_i9.Genres>> fetchGenres() => (super.noSuchMethod(
        Invocation.method(
          #fetchGenres,
          [],
        ),
        returnValue: _i7.Future<List<_i9.Genres>>.value(<_i9.Genres>[]),
      ) as _i7.Future<List<_i9.Genres>>);

  @override
  _i7.Future<List<_i11.Movie>> fetchDiscover({
    int? page = 1,
    int? genres = 0,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchDiscover,
          [],
          {
            #page: page,
            #genres: genres,
          },
        ),
        returnValue: _i7.Future<List<_i11.Movie>>.value(<_i11.Movie>[]),
      ) as _i7.Future<List<_i11.Movie>>);
}
