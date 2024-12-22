import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/core/presentation/widget/app_skeleton.dart';
import 'package:flutter_movie_app/core/routes.dart';
import 'package:flutter_movie_app/features/stream_movie/data/models/search_slug.dart';

class AppStreamLink extends StatelessWidget {
  const AppStreamLink({
    super.key,
    required this.item,
  });

  final SearchSlug item;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Stack(
        children: [
          // Content
          Positioned(
              left: 120,
              top: 10,
              right: 0,
              child: Text(
                item.title,
                overflow: TextOverflow.ellipsis,
              )),

          Positioned(
            bottom: 20,
            left: 100,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10)),
              child: Wrap(
                children: [
                  ...item.link.map(
                    (e) => GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.movieStream,
                              arguments: e.url);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 3, horizontal: 6),
                          margin: const EdgeInsets.symmetric(
                              vertical: 3, horizontal: 6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: getColorFromText(e.name).withOpacity(0.4),
                          ),
                          child: Text(e.name),
                        )),
                  )
                ],
              ),
            ),
          ),

          // Image
          SizedBox(
            height: 162,
            width: 110,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(13),
              child: CachedNetworkImage(imageUrl: item.poster),
            ),
          ),
        ],
      ),
    );
  }

  static Widget loading() {
    return SizedBox(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 10, // Jumlah skeleton placeholder
        itemBuilder: (context, index) {
          return skeleton();
        },
      ),
    );
  }

  static Padding skeleton() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: [
            AppSkeleton(
              height: 162,
              width: 110,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                children: [
                  AppSkeleton(
                    height: 30,
                  ),
                  SizedBox(height: 10),
                  AppSkeleton(
                    height: 80,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color getColorFromText(String text) {
    final hash = text.codeUnits.fold(0, (prev, element) => prev + element);
    final random = Random(hash);

    // Set minimum RGB value untuk memastikan warna lebih cerah
    const minColorValue = 100; // Warna minimum
    const maxColorValue = 255; // Warna maksimum

    final r = minColorValue + random.nextInt(maxColorValue - minColorValue);
    final g = minColorValue + random.nextInt(maxColorValue - minColorValue);
    final b = minColorValue + random.nextInt(maxColorValue - minColorValue);

    return Color.fromARGB(255, r, g, b); // Opaque color
  }
}
