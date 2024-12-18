import 'package:flutter/material.dart';
import 'package:flutter_movie_app/core/routes.dart';

class AppButtonPlayTrailer extends StatelessWidget {
  final int movieId;
  const AppButtonPlayTrailer({
    super.key,
    required this.movieId,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, Routes.clipMovie, arguments: {
        'movieId': movieId,
        'title': 'Trailers',
        'providerKey': 'movie_clip',
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
              'Play Trailer',
              style: TextStyle(fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}
