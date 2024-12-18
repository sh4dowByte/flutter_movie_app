import 'package:flutter/material.dart';
import 'package:flutter_movie_app/core/routes.dart';

class AppButtonPlayVideo extends StatelessWidget {
  final int seriesId;
  final int? seasonNumber;
  final int? episodeNumber;
  const AppButtonPlayVideo({
    super.key,
    required this.seriesId,
    this.seasonNumber,
    this.episodeNumber,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, Routes.clipMovie, arguments: {
        'title': 'Tv Clip Video',
        'providerKey': 'tv_clip',
        'seriesId': seriesId,
        'seasonNumber': seasonNumber,
        'episodeNumber': episodeNumber,
      }),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            end: Alignment.topCenter, // Awal gradien
            begin: Alignment.bottomCenter, // Akhir gradien
            colors: [
              Theme.of(context).hintColor.withOpacity(0.1),
              Theme.of(context).hintColor.withOpacity(0.1),
              Theme.of(context).hintColor.withOpacity(0.1), // Warna akhir
            ],
          ),
        ),
        width: 130,
        height: 34,
        child: const Row(
          children: [
            Icon(Icons.play_arrow_rounded),
            SizedBox(width: 10),
            Text(
              'Play Clip',
              style: TextStyle(fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}
