import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/core/routes.dart';
import 'package:flutter_movie_app/core/utils/image_url_helper.dart';
import 'package:flutter_movie_app/core/widget/app_skeleton.dart';

class AppCastImage extends StatelessWidget {
  const AppCastImage({
    super.key,
    this.margin,
    required this.actorId,
    this.image,
    required this.name,
    required this.character,
  });

  final EdgeInsets? margin;
  final int actorId;
  final String? image;
  final String name;
  final String character;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onTap: () =>
          Navigator.pushNamed(context, Routes.actorDetail, arguments: actorId),
      child: Column(
        children: [
          Container(
            margin: margin,
            height: 80, // Tinggi sama
            width: 80, // Lebar sama
            child: ClipRRect(
              borderRadius:
                  BorderRadius.circular(40), // Setengah dari tinggi/lebar
              child: CachedNetworkImage(
                imageUrl: ImageUrlHelper.getProfileUrl(image,
                    size: ImageSize.profileW185),
                placeholder: (context, string) {
                  return CachedNetworkImage(
                    imageUrl:
                        'https://img.icons8.com/?size=480&id=z-JBA_KtSkxG&format=png',
                    fit: BoxFit.cover,
                  );
                },
                fit: BoxFit.cover, // Memastikan gambar memenuhi lingkaran
              ),
            ),
          ),
          Container(
            width: 110,
            margin: margin,
            child: Column(
              children: [
                Text(
                  name,
                  style: Theme.of(context).textTheme.labelSmall,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                ),
                Text(character,
                    style: const TextStyle(fontSize: 10),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    maxLines: 2),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget loading() {
    return SizedBox(
      height: 110,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10, // Jumlah skeleton placeholder
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(80),
                  child: const AppSkeleton(
                    width: 80,
                    height: 80,
                  ),
                ),
                const SizedBox(height: 10),
                const AppSkeleton(
                  height: 20,
                  width: 80,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
