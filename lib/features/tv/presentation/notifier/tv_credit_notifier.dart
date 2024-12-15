import 'package:flutter_movie_app/features/tv/data/models/tv_credits.dart';
import 'package:flutter_movie_app/features/tv/domain/usecases/get_credits_tv.dart';
import 'package:flutter_movie_app/features/tv/presentation/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getCreditTvProvider =
    Provider((ref) => GetCreditsTv(ref.watch(tvRepositoryProvider)));

final creditTvProvider =
    StateNotifierProvider.family<CreditTvNotifier, AsyncValue<TvCredits>, int>(
  (ref, movieId) {
    final getRecomendedTv = ref.watch(getCreditTvProvider);
    return CreditTvNotifier(getRecomendedTv);
  },
);

class CreditTvNotifier extends StateNotifier<AsyncValue<TvCredits>> {
  final GetCreditsTv _getCreditTv;

  CreditTvNotifier(this._getCreditTv) : super(const AsyncValue.loading());

  bool _isGetting = false;

  // Memuat halaman pertama
  Future<void> getInitial(int seriesId) async {
    if (_isGetting) return;

    _isGetting = true;
    state = const AsyncValue.loading();

    final result = await _getCreditTv(seriesId);

    result.fold(
      (failure) {
        state = AsyncValue.error(failure.message, StackTrace.current);
      },
      (genre) {
        state = AsyncValue.data(genre);
      },
    );

    _isGetting = false;
  }
}
