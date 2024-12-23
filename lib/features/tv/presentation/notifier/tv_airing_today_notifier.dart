import 'package:flutter_movie_app/features/tv/data/models/tv.dart';
import 'package:flutter_movie_app/features/tv/domain/usecases/get_airing_today_tv.dart';
import 'package:flutter_movie_app/features/tv/presentation/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getAiringTvTodayProvider =
    Provider((ref) => GetAiringTodayTv(ref.watch(tvRepositoryProvider)));

final airingTvTodayProvider = StateNotifierProvider.family<
    AiringTvTodayNotifier, AsyncValue<List<Tv>>, String>(
  (ref, date) {
    final getAiringTvToday = ref.watch(getAiringTvTodayProvider);
    return AiringTvTodayNotifier(getAiringTvToday);
  },
);

class AiringTvTodayNotifier extends StateNotifier<AsyncValue<List<Tv>>> {
  final GetAiringTodayTv _getData;

  AiringTvTodayNotifier(this._getData) : super(const AsyncValue.loading());

  int _currentPage = 1;
  bool _isGetting = false;
  bool _isLoadingNextPage = false;
  bool _isPageEnded = false;

  // Cache untuk menyimpan data berdasarkan tanggal
  final Map<String, List<Tv>> _cache = {};

  // Reset cache untuk semua data atau tanggal tertentu
  void resetCache({String? date}) {
    if (date != null) {
      _cache.remove(date); // Hapus cache untuk tanggal tertentu
    } else {
      _cache.clear(); // Hapus semua cache
    }
  }

  Future<void> getInitial({required String dateToday}) async {
    if (_isGetting) return;

    _isGetting = true;
    _isPageEnded = false;

    // Jika data sudah ada di cache, langsung gunakan
    if (_cache.containsKey(dateToday)) {
      state = AsyncValue.data(_cache[dateToday]!);
      _isGetting = false;
      return;
    }

    state = const AsyncValue.loading(); // Tampilkan loading untuk data awal

    final result =
        await _getData(1, dateToday: dateToday); // Reset ke halaman 1

    result.fold(
      (failure) {
        state = AsyncValue.error(failure.message, StackTrace.current);
      },
      (movies) {
        _currentPage = 2;
        state = AsyncValue.data(movies);
        _cache[dateToday] = movies; // Simpan data ke cache
      },
    );

    _isGetting = false;
  }

  Future<void> getNextPage() async {
    if (_isGetting || _isLoadingNextPage || _isPageEnded) return;

    _isLoadingNextPage = true;

    state = state.when(
      data: (movies) => AsyncValue.data([...movies]), // Pertahankan data
      loading: () => const AsyncValue.loading(),
      error: (error, stack) => AsyncValue.error(error, stack),
    );

    final result = await _getData(_currentPage);

    result.fold(
      (failure) {},
      (movies) {
        state = AsyncValue.data([
          ...(state.value ?? []), // Data sebelumnya
          ...movies,
        ]);
        if (movies.isNotEmpty) {
          _currentPage++;
        } else {
          _isPageEnded = true;
        }
      },
    );

    _isLoadingNextPage = false;
  }

  bool get isLoadingNextPage => _isLoadingNextPage;
}
