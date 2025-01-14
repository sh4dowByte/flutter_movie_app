import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/core/presentation/widget/app_skeleton.dart';
import 'package:flutter_movie_app/core/routes.dart';
import 'package:flutter_movie_app/core/utils/image_url_helper.dart';
import 'package:flutter_movie_app/features/people/presentation/notifier/actor_trending.dart';
import 'package:flutter_movie_app/features/people/presentation/position_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PeoplePage extends ConsumerStatefulWidget {
  const PeoplePage({super.key});

  @override
  _PeoplePageState createState() => _PeoplePageState();
}

class _PeoplePageState extends ConsumerState<PeoplePage> {
  Rect focusRect = Rect.zero;
  Rect screenRect = Rect.zero;
  Rect limitRect = Rect.zero;
  Size screenSize = Size.zero;

  // Offset position = Offset.zero;

  List<BubbleMenuItem> generatedBubbles = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final MediaQueryData query = MediaQuery.of(context);
      screenSize =
          Size(query.size.width, query.size.height - query.padding.top);
      final double mainPadding = screenSize.width * 0.25;
      final double mainWidth = screenSize.width - (mainPadding * 2);
      final double mainHeight = screenSize.height - (mainPadding * 2);

      final double midPadding = screenSize.width * 0.10;
      final double midWidth = screenSize.width - (midPadding * 2);
      final double midHeight = screenSize.height - (midPadding * 2);

      screenRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
      focusRect =
          Rect.fromLTWH(mainPadding, mainPadding, mainWidth, mainHeight);
      limitRect = Rect.fromLTWH(midPadding, midPadding, midWidth, midHeight);

      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await ref.read(actorTrendingProvider.notifier).getInitial();
      });
    });
  }

  // void updatePosition(Offset delta) {
  //   setState(() {
  //     // Hitung posisi baru
  //     double newX = position.dx + delta.dx;
  //     double newY = position.dy + delta.dy;

  //     // Batasi posisi agar hanya bisa negatif
  //     final double minX = -screenSize.width - 300; // Batas kiri (negatif penuh)
  //     final double minY = -generatedBubbles.last.position.dy +
  //         generatedBubbles.last.radius * 2; // Batas atas (negatif penuh)
  //     const double maxX = 40; // Tidak boleh lebih dari 0
  //     const double maxY = 40; // Tidak boleh lebih dari 0

  //     // Terapkan pembatasan posisi ke negatif
  //     position = Offset(
  //       newX.clamp(minX, maxX),
  //       newY.clamp(minY, maxY),
  //     );

  //     // Ambil posisi bubble terakhir
  //     if (generatedBubbles.isNotEmpty) {
  //       final lastBubble = generatedBubbles.last;
  //       final lastBubbleBottomPosition =
  //           position.dy + lastBubble.position.dy + lastBubble.radius * 2;

  //       // Jika posisi terakhir sudah hampir keluar dari layar
  //       if (lastBubbleBottomPosition <= screenSize.height - 100) {
  //         ref.read(actorTrendingProvider.notifier).getNextPage();
  //       }
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final actorTrendingState = ref.watch(actorTrendingProvider);

    return SafeArea(
      child: Scaffold(
        body: actorTrendingState.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Center(
              child: Text('Error: $error',
                  style: const TextStyle(color: Colors.red))),
          data: (actors) {
            // Bubble akan dibuat langsung berdasarkan data
            final double maxBubbleWidth = screenSize.width / 4;
            final double itemRadius = maxBubbleWidth * 0.47;

            generatedBubbles.clear();

            // Bubble generator
            int actorIndex = 0;
            int rowIndex = 0;

            while (true) {
              rowIndex++;
              for (int columnIndex = 0; columnIndex < 5; columnIndex++) {
                if (actorIndex >= actors.length) break;

                final double offsetWidth = rowIndex.isEven ? 0 : itemRadius;
                final Offset position = Offset(
                  (columnIndex * maxBubbleWidth) + offsetWidth,
                  (rowIndex * maxBubbleWidth),
                );

                final int currentIndex = actorIndex;

                generatedBubbles.add(
                  BubbleMenuItem(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: itemRadius * 2,
                        height: itemRadius * 2,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(itemRadius),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, Routes.actorDetail,
                                  arguments: actors[currentIndex].id);
                            },
                            child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                    const AppSkeleton(),
                                imageUrl: ImageUrlHelper.getProfileUrl(
                                    actors[currentIndex].profilePath)),
                          ),
                        ),
                      ),
                    ),
                    radius: itemRadius,
                    position: position,
                  ),
                );

                actorIndex++;
              }
              if (actorIndex >= actors.length) break;
            }

            final position = ref.watch(positionProvider);

            return GestureDetector(
              behavior: HitTestBehavior.translucent,
              onPanUpdate: (panUpdateData) {
                ref.read(positionProvider.notifier).updatePosition(
                    panUpdateData.delta, screenSize, generatedBubbles);
              },
              child: Stack(
                children: generatedBubbles.map((item) {
                  final Offset newPosition = Offset(
                      position.dx + item.position.dx,
                      position.dy + item.position.dy);
                  final Offset centerPosition =
                      newPosition.translate(item.radius, item.radius);

                  if (focusRect.contains(centerPosition)) {
                    return Positioned(
                      top: newPosition.dy,
                      left: newPosition.dx,
                      child: item.child,
                    );
                  } else {
                    double scale = 1.0;
                    double xScale = 1.0, yScale = 1.0;
                    bool top = false,
                        right = false,
                        bottom = false,
                        left = false;

                    if (screenRect.contains(centerPosition)) {
                      // X scale Check
                      if (centerPosition.dx < focusRect.left) {
                        xScale = 1 -
                            ((focusRect.left - centerPosition.dx) /
                                (focusRect.left - limitRect.left));
                        left = true;
                      } else if (centerPosition.dx > focusRect.right) {
                        xScale = 1 -
                            ((centerPosition.dx - focusRect.right) /
                                (limitRect.right - focusRect.right));
                        right = true;
                      }
                      // Y scale Check
                      if (centerPosition.dy < focusRect.top) {
                        yScale = 1 -
                            ((focusRect.top - centerPosition.dy) /
                                (focusRect.top - limitRect.top));
                        centerPosition.dy / focusRect.top;
                        top = true;
                      } else if (centerPosition.dy > focusRect.bottom) {
                        yScale = 1 -
                            ((centerPosition.dy - focusRect.bottom) /
                                (limitRect.bottom - focusRect.bottom));
                        bottom = true;
                      }
                      // Average Scale
                      scale = (xScale + yScale) / 2;
                      scale = scale.clamp(0.0, 1.0);
                    } else {
                      scale = 0.0;
                    }

                    return Positioned(
                      top: newPosition.dy,
                      left: newPosition.dx,
                      child: Transform.scale(
                        alignment: Alignment(left ? 0.5 : (right ? -0.5 : 0),
                            top ? 0.5 : (bottom ? -0.5 : 0)),
                        scale: scale,
                        child: item.child,
                      ),
                    );
                  }
                }).toList(),
              ),
            );
          },
        ),
      ),
    );
  }
}
