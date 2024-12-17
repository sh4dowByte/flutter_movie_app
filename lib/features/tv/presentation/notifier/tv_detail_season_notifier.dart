import 'package:flutter_movie_app/features/tv/data/models/tv_seasons.dart';
import 'package:flutter_movie_app/features/tv/domain/usecases/get_detail_tv_season.dart';
import 'package:flutter_movie_app/features/tv/presentation/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getDetailTvSeasonProvider =
    Provider((ref) => GetDetailTvSeason(ref.watch(tvRepositoryProvider)));

final detailTvSeasonProvider = StateNotifierProvider.family<
    DetailSeasonTvNotifier, AsyncValue<TvSeason>, int>(
  (ref, seriesId) {
    final getDetailTvSeason = ref.watch(getDetailTvSeasonProvider);
    final notifier = DetailSeasonTvNotifier(getDetailTvSeason);
    return notifier;
  },
);

class DetailSeasonTvNotifier extends StateNotifier<AsyncValue<TvSeason>> {
  final GetDetailTvSeason _getDetailTvSeason;

  DetailSeasonTvNotifier(this._getDetailTvSeason)
      : super(const AsyncValue.loading());

  bool _isGetting = false;

  // Memuat halaman pertama
  Future<void> getInitial(int seriesId, int seasonNumber) async {
    if (_isGetting) return;

    _isGetting = true;

    state = const AsyncValue.loading(); // Tampilkan loading untuk data awal

    final result =
        await _getDetailTvSeason(seriesId, seasonNumber); // Reset ke halaman 1

    result.fold(
      (failure) {
        state = AsyncValue.error(failure, StackTrace.current);
      },
      (tv) {
        state = AsyncValue.data(tv);
      },
    );

    _isGetting = false;
  }
}
