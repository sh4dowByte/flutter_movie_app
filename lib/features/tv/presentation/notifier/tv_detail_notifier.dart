import 'package:flutter_movie_app/features/tv/data/models/tv_detail.dart';
import 'package:flutter_movie_app/features/tv/domain/usecases/get_detail_tv.dart';
import 'package:flutter_movie_app/features/tv/presentation/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getDetailTvProvider =
    Provider((ref) => GetDetailTv(ref.watch(tvRepositoryProvider)));

final detailTvProvider =
    StateNotifierProvider.family<DetailTvNotifier, AsyncValue<TvDetail>, int>(
  (ref, seriesId) {
    final getDetailTv = ref.watch(getDetailTvProvider);
    final notifier = DetailTvNotifier(getDetailTv);
    return notifier;
  },
);

class DetailTvNotifier extends StateNotifier<AsyncValue<TvDetail>> {
  final GetDetailTv _getDetailTv;

  DetailTvNotifier(this._getDetailTv) : super(const AsyncValue.loading());

  bool _isGetting = false;

  // Memuat halaman pertama
  Future<void> getInitial(int seriesId) async {
    if (_isGetting) return;

    _isGetting = true;

    state = const AsyncValue.loading(); // Tampilkan loading untuk data awal

    final result = await _getDetailTv(seriesId); // Reset ke halaman 1

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
