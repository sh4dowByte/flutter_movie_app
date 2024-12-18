import 'package:flutter_movie_app/core/data/models/stills_images.dart';
import 'package:flutter_movie_app/features/tv/domain/usecases/get_stills_image_tv.dart';
import 'package:flutter_movie_app/features/tv/presentation/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getStillsImageEpisodeProvider =
    Provider((ref) => GetStillsImageTv(ref.watch(tvRepositoryProvider)));

final stillsImageTvEpisodeProvider = StateNotifierProvider.family<
    StillsImageEpisodeTvNotifier, AsyncValue<List<StillsImage>>, int>(
  (ref, seriesId) {
    final getStillsImageEpisode = ref.watch(getStillsImageEpisodeProvider);
    final notifier = StillsImageEpisodeTvNotifier(getStillsImageEpisode);
    return notifier;
  },
);

class StillsImageEpisodeTvNotifier
    extends StateNotifier<AsyncValue<List<StillsImage>>> {
  final GetStillsImageTv _getStillsImageTvEpisode;

  StillsImageEpisodeTvNotifier(this._getStillsImageTvEpisode)
      : super(const AsyncValue.loading());

  bool _isGetting = false;

  // Memuat halaman pertama
  Future<void> getInitial(
      int seriesId, int seasonNumber, int episodeNumber) async {
    if (_isGetting) return;

    _isGetting = true;

    state = const AsyncValue.loading(); // Tampilkan loading untuk data awal

    final result = await _getStillsImageTvEpisode(
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
