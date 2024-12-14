import 'package:flutter_movie_app/features/tv/data/models/tv.dart';
import 'package:flutter_movie_app/features/tv/domain/usecases/get_search_tv.dart';
import 'package:flutter_movie_app/features/tv/presentation/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getSearchTvProvider =
    Provider((ref) => GetSearchTv(ref.watch(tvRepositoryProvider)));

final searchTvProvider =
    StateNotifierProvider<DiscoverTvNotifier, AsyncValue<List<Tv>>>(
  (ref) {
    final getSearchTv = ref.watch(getSearchTvProvider);
    return DiscoverTvNotifier(getSearchTv);
  },
);

class DiscoverTvNotifier extends StateNotifier<AsyncValue<List<Tv>>> {
  final GetSearchTv _getSearchTv;

  DiscoverTvNotifier(this._getSearchTv) : super(const AsyncValue.loading());

  int _currentPage = 1;
  bool _isGetting = false;
  bool _isLoadingNextPage = false;
  bool _isPageEnded = false;

  late String _currentKeyword;

  // Memuat halaman pertama
  Future<void> getInitial(String keywords) async {
    if (_isGetting) return;

    _isGetting = true;
    _isPageEnded = false;
    _currentKeyword = keywords;

    state = const AsyncValue.loading(); // Tampilkan loading untuk data awal

    final result = await _getSearchTv(1, keywords); // Reset ke halaman 1

    result.fold(
      (failure) {
        state = AsyncValue.error(failure, StackTrace.current);
      },
      (tv) {
        _currentPage = 2;
        state = AsyncValue.data(tv);
      },
    );

    _isGetting = false;
  }

  // Memuat halaman berikutnya
  Future<void> getNextPage() async {
    if (_isGetting || _isLoadingNextPage || _isPageEnded) return;

    _isLoadingNextPage = true;

    // Tampilkan state dengan status loading tambahan untuk halaman berikutnya
    state = state.when(
      data: (tv) => AsyncValue.data([...tv]), // Pertahankan data
      loading: () => const AsyncValue.loading(),
      error: (error, stack) => AsyncValue.error(error, stack),
    );

    final result = await _getSearchTv(_currentPage, _currentKeyword);

    result.fold(
      (failure) {},
      (tv) {
        state = AsyncValue.data([
          ...(state.value ?? []), // Data sebelumnya
          ...tv,
        ]);
        if (tv.isNotEmpty) {
          _currentPage++;
        } else {
          _isPageEnded = true;
        }
      },
    );

    _isLoadingNextPage = false;
  }

  // Status apakah sedang memuat halaman berikutnya
  bool get isLoadingNextPage => _isLoadingNextPage;
}
