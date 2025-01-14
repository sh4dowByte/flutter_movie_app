import 'package:flutter/material.dart';
import 'package:flutter_movie_app/features/people/presentation/notifier/actor_trending.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final positionProvider = StateNotifierProvider<PositionNotifier, Offset>(
  (ref) => PositionNotifier(ref),
);

class PositionNotifier extends StateNotifier<Offset> {
  final Ref ref;
  PositionNotifier(this.ref) : super(Offset.zero);

  // Update posisi berdasarkan input gesture
  void updatePosition(
      Offset delta, Size screenSize, List<BubbleMenuItem> bubbles) {
    final double newX = state.dx + delta.dx;
    final double newY = state.dy + delta.dy;

    // Batasi posisi
    final double minX = -screenSize.width + 200; // Batas kiri (negatif penuh)
    final double minY = -bubbles.last.position.dy +
        screenSize.height; // Batas atas (negatif penuh)
    const double maxX = 40; // Tidak boleh lebih dari 0
    const double maxY = 40; // Tidak boleh lebih dari 0

    state = Offset(
      newX.clamp(minX, maxX),
      newY.clamp(minY, maxY),
    );

    // Cek apakah posisi terakhir membutuhkan halaman berikutnya
    if (bubbles.isNotEmpty) {
      final lastBubble = bubbles.last;
      final lastBubbleBottomPosition =
          state.dy + lastBubble.position.dy + lastBubble.radius * 2;

      print([lastBubbleBottomPosition, (screenSize.height + 120)]);

      if (lastBubbleBottomPosition <= screenSize.height + 120) {
        print('getnext page');
        ref.read(actorTrendingProvider.notifier).getNextPage();
      }
    }
  }
}

class BubbleMenuItem {
  final Offset position;
  final Widget child;
  final double radius;

  const BubbleMenuItem({
    required this.child,
    required this.radius,
    required this.position,
  });

  BubbleMenuItem copyWith({
    Offset? position,
    Widget? child,
    double? radius,
  }) {
    return BubbleMenuItem(
      position: position ?? this.position,
      child: child ?? this.child,
      radius: radius ?? this.radius,
    );
  }
}
