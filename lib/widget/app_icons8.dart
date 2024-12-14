// ignore_for_file: unused_element

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AppIcons8 extends StatelessWidget {
  const AppIcons8({super.key});

  static Widget getById(
    String id, {
    int? width = 48,
    int? height = 48,
    int? size = 480,
    BoxFit? fit,
  }) {
    final image = 'https://img.icons8.com/?size=$size&id=$id&format=png';

    return CachedNetworkImage(
      imageUrl: image,
      fit: fit ?? BoxFit.cover,
      width: width?.toDouble(),
      height: height?.toDouble(),
      errorWidget: (context, error, stackTrace) {
        return const Center(
          child: Icon(Icons.new_releases_outlined),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
