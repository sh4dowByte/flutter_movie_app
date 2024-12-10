import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter_movie_app/features/movie/domain/usecases/get_detail_movies.dart.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';
import '../../dummy_data/dummy_objects.dart';

// Create Mock classes

void main() {
  late GetDetailMovies usecase;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    usecase = GetDetailMovies(mockMovieRepository);
  });

  test('should get movie detail from the repository', () async {
    // arrange
    const tId = 1106739;
    when(mockMovieRepository.getMovieDetail(tId)).thenAnswer((_) async {
      log("Mocked call with tId: $tId");
      return Right(testMovieDetail);
    });
    // act
    final result = await usecase.call(tId);

    // assert
    expect(result, Right(testMovieDetail));
  });
}
