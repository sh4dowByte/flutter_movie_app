export 'package:flutter_movie_app/core/errors/failure.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/core/errors/failure.dart';
import 'package:flutter_movie_app/core/presentation/widget/widget.dart';

class AppError<T extends Failure> extends StatelessWidget {
  final T error;
  final StackTrace? stackTrace;
  final Function()? onReload;

  const AppError(this.error, {super.key, this.stackTrace, this.onReload});

  @override
  Widget build(BuildContext context) {
    String? imageUrl;

    if (error is NetworkFailure) {
      imageUrl =
          "https://img.icons8.com/?size=480&id=USKa6w9LTU3A&format=png"; // Ikon jaringan error
    } else if (error is EmptyDataFailure) {
      imageUrl =
          "https://img.icons8.com/?size=480&id=lj7F2FvSJWce&format=png"; // Ikon data kosong
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Offstage(
          offstage: imageUrl == null,
          child: CachedNetworkImage(
            width: 200,
            imageUrl: imageUrl!,
            errorWidget: (context, url, error) =>
                const Icon(Icons.error, size: 100),
          ),
        ),
        const SizedBox(height: 20),
        Center(
            child: Text(error.message, style: const TextStyle(fontSize: 16))),
        if (onReload != null) ...[
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: AppButton(
              text: 'Reload',
              onTap: onReload,
            ),
          ),
        ],
      ],
    );
  }
}
