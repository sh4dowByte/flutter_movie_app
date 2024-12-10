import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';
import '../../dummy_data/dummy_objects.dart';

void main() {
  late MockMovieService mockMovieService;

  setUp(() {
    mockMovieService = MockMovieService();
  });

  group('MovieService Test', () {
    test('Should return a movie detail when the response code is 200',
        () async {
      // Arrange
      when(mockMovieService.fetchMovieDetails(any))
          .thenAnswer((_) async => testMovieDetail);

      // Act
      final result = await mockMovieService.fetchMovieDetails(1);

      // Assert
      expect(result, equals(testMovieDetail));
    });

    test('Should return a movie discover when the response code is 200',
        () async {
      // Arrange
      when(mockMovieService.fetchDiscover(
              page: anyNamed('page'), genres: anyNamed('genres')))
          .thenAnswer((_) async => [testMovie]);

      // Act
      final result = await mockMovieService.fetchDiscover(page: 1, genres: 1);

      // Assert
      expect(result, equals([testMovie])); // Bandingkan dengan list
    });
  });
}
