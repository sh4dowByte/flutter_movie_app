import 'package:flutter_movie_app/features/favorite/data/models/favorite.dart';
import 'package:flutter_movie_app/features/favorite/domain/usecases/tv/add_favorite_tv.dart';
import 'package:flutter_movie_app/features/favorite/domain/usecases/tv/get_favorite_tv.dart';
import 'package:flutter_movie_app/features/favorite/domain/usecases/tv/remove_favorite_tv.dart';
import 'package:flutter_movie_app/features/favorite/presentation/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getFavoriteTvProvider =
    Provider((ref) => GetFavoriteTv(ref.watch(tvRepositoryProvider)));

final addFavoriteTvProvider =
    Provider((ref) => AddFavoriteTv(ref.watch(tvRepositoryProvider)));

final removeFavoriteTvProvider =
    Provider((ref) => RemoveFavoriteTv(ref.watch(tvRepositoryProvider)));

final favoriteTvProvider =
    StateNotifierProvider<FavoriteTvNotifier, AsyncValue<List<Favorite>>>(
  (ref) {
    final getFavoriteTv = ref.watch(getFavoriteTvProvider);
    final addFavoriteTv = ref.watch(addFavoriteTvProvider);
    final removeFavoriteTv = ref.watch(removeFavoriteTvProvider);
    return FavoriteTvNotifier(getFavoriteTv, addFavoriteTv, removeFavoriteTv);
  },
);

class FavoriteTvNotifier extends StateNotifier<AsyncValue<List<Favorite>>> {
  final GetFavoriteTv _getFavoriteTv;
  final AddFavoriteTv _addFavoriteTv;
  final RemoveFavoriteTv _removeFavoriteTv;

  FavoriteTvNotifier(
      this._getFavoriteTv, this._addFavoriteTv, this._removeFavoriteTv)
      : super(const AsyncValue.loading());

  bool _isGetting = false;

  // Memuat halaman pertama
  Future<void> getFavoriteTv() async {
    if (_isGetting) return;

    _isGetting = true;

    state = const AsyncValue.loading(); // Tampilkan loading untuk data awal

    final result = await _getFavoriteTv(); // Reset ke halaman 1

    result.fold(
      (failure) {
        state = AsyncValue.error(failure, StackTrace.current);
      },
      (actor) {
        state = AsyncValue.data(actor);
      },
    );

    _isGetting = false;
  }

  Future<void> toggleFavoriteTv(Favorite fav) async {
    final currentFavorites = state.asData?.value ?? [];

    if (_isFavorite(fav.id)) {
      // Jika film sudah ada, hapus dari daftar favorit
      await _removeFavoriteTv(fav.id);

      // Perbarui state
      state = AsyncValue.data(
          currentFavorites.where((m) => m.id != fav.id).toList());

      if (state.asData!.value.isEmpty) {
        getFavoriteTv();
      }
    } else {
      // Jika film belum ada, tambahkan ke daftar favorit
      await _addFavoriteTv(fav);

      // Perbarui state
      getFavoriteTv();
    }
  }

  bool _isFavorite(int movieId) {
    final favoriteTv = state.asData?.value ?? [];
    return favoriteTv.any((movie) => movie.id == movieId);
  }
}
