import 'package:flutter_movie_app/core/data/models/movie_clip.dart';
import 'package:flutter_movie_app/features/tv/domain/usecases/get_clip_tv.dart';
import 'package:flutter_movie_app/features/tv/presentation/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getClipTvProvider =
    Provider((ref) => GetTvClips(ref.watch(tvRepositoryProvider)));

final clipTvProvider =
    StateNotifierProvider<ClipTvNotifier, AsyncValue<List<MovieClip>>>(
  (ref) {
    final getNowPlayingTv = ref.watch(getClipTvProvider);
    return ClipTvNotifier(getNowPlayingTv);
  },
);

class ClipTvNotifier extends StateNotifier<AsyncValue<List<MovieClip>>> {
  final GetTvClips _getClipTv;

  ClipTvNotifier(this._getClipTv) : super(const AsyncValue.loading());

  bool _isGetting = false;

  // Memuat halaman pertama
  Future<void> getInitial(
      int seriesId, int? seasonNumber, int? episodeNumber) async {
    if (_isGetting) return;

    _isGetting = true;

    state = const AsyncValue.loading();

    final result = await _getClipTv(seriesId, seasonNumber, episodeNumber);

    result.fold(
      (failure) {
        state = AsyncValue.error(failure.message, StackTrace.current);
      },
      (movies) {
        state = AsyncValue.data(movies);
      },
    );

    _isGetting = false;
  }
}
