import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Provider untuk IsAdultNotifier
final isAdultProvider = StateNotifierProvider<IsAdultNotifier, bool>(
  (ref) => IsAdultNotifier(),
);

class IsAdultNotifier extends StateNotifier<bool> {
  IsAdultNotifier() : super(false) {
    _loadIsAdult();
  }

  // Fungsi untuk memuat status awal dari SharedPreferences
  void _loadIsAdult() async {
    final prefs = await SharedPreferences.getInstance();
    state = prefs.getBool('isAdult') ?? false; // Default adalah false
  }

  // Fungsi untuk toggle isAdult
  void toggleIsAdult() async {
    final prefs = await SharedPreferences.getInstance();
    state = !state; // Toggle nilai
    await prefs.setBool('isAdult', state); // Simpan ke SharedPreferences
  }
}
