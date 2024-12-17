import 'package:flutter_movie_app/features/tv/data/models/tv_episode.dart';
import 'package:flutter_movie_app/features/tv/domain/usecases/get_detail_tv_Episode.dart';
import 'package:flutter_movie_app/features/tv/presentation/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getDetailTvEpisodeProvider =
    Provider((ref) => GetDetailTvEpisode(ref.watch(tvRepositoryProvider)));

final detailTvEpisodeProvider = StateNotifierProvider.family<
    DetailEpisodeTvNotifier, AsyncValue<TvEpisode>, int>(
  (ref, seriesId) {
    final getDetailTvEpisode = ref.watch(getDetailTvEpisodeProvider);
    final notifier = DetailEpisodeTvNotifier(getDetailTvEpisode);
    return notifier;
  },
);

class DetailEpisodeTvNotifier extends StateNotifier<AsyncValue<TvEpisode>> {
  final GetDetailTvEpisode _getDetailTvEpisode;

  DetailEpisodeTvNotifier(this._getDetailTvEpisode)
      : super(const AsyncValue.loading());

  bool _isGetting = false;

  // Memuat halaman pertama
  Future<void> getInitial(
      int seriesId, int seasonNumber, int episodeNumber) async {
    if (_isGetting) return;

    _isGetting = true;

    state = const AsyncValue.loading(); // Tampilkan loading untuk data awal

    final result = await _getDetailTvEpisode(
        seriesId, seasonNumber, episodeNumber); // Reset ke halaman 1

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
