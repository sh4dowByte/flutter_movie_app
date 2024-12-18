import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/core/pallete.dart';
import 'package:flutter_movie_app/core/routes.dart';
import 'package:flutter_movie_app/core/utils/date_helper.dart';
import 'package:flutter_movie_app/core/utils/image_url_helper.dart';
import 'package:flutter_movie_app/core/presentation/widget/star_rating.dart';
import 'package:flutter_movie_app/features/tv/data/models/tv.dart';
import 'package:flutter_movie_app/core/presentation/widget/app_skeleton.dart';

class AppTvCoverBox extends StatelessWidget {
  const AppTvCoverBox({
    super.key,
    required this.item,
    required this.margin,
    this.replaceRoute = false,
  });

  final Tv item;
  final EdgeInsets margin;
  final bool replaceRoute;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      onTap: () {
        if (replaceRoute) {
          Navigator.pushReplacementNamed(context, Routes.tvDetail,
              arguments: item.id);
        } else {
          Navigator.pushNamed(context, Routes.tvDetail, arguments: item.id);
        }
      },
      child: Container(
        margin: margin,
        width: 162,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(13),
          child: CachedNetworkImage(
            imageUrl: ImageUrlHelper.getPosterUrl(item.posterPath,
                size: ImageSize.posterW342),
            placeholder: (context, url) => const AppSkeleton(),
            fit: BoxFit.cover,
            errorWidget: (context, url, error) => Container(
              color: Pallete.grey1,
              child: Image.asset(
                'assets/broken.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }

  static Widget loading() {
    return SizedBox(
      height: 220,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
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
      child: AppSkeleton(
        width: 162,
      ),
    );
  }
}

class AppTvCoverTile extends StatelessWidget {
  const AppTvCoverTile({
    super.key,
    required this.item,
    this.replaceRoute = false,
  });

  final Tv item;
  final bool replaceRoute;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      onTap: () {
        if (replaceRoute) {
          Navigator.pushReplacementNamed(context, Routes.tvDetail,
              arguments: item.id);
        } else {
          Navigator.pushNamed(context, Routes.tvDetail, arguments: item.id);
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: Stack(
          children: [
            // Content
            Positioned(
                left: 120,
                top: 10,
                right: 0,
                child: Text(
                  item.name,
                  overflow: TextOverflow.ellipsis,
                )),

            if (item.character != null) ...[
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: Text(
                    item.character!,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelSmall,
                  )),
            ],

            Positioned(
              bottom: 20,
              left: 100,
              right: 0,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        StarRating(
                          rating: item.voteAverage,
                          starSize: 14,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          DateHelper.toYear(item.firstAirDate),
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      item.overview,
                      style: Theme.of(context).textTheme.labelSmall,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
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
                child: CachedNetworkImage(
                  imageUrl: ImageUrlHelper.getPosterUrl(item.posterPath,
                      size: ImageSize.posterW185),
                  placeholder: (context, url) => const AppSkeleton(),
                  errorWidget: (context, url, error) => Container(
                    color: Pallete.grey1,
                    child: Image.asset(
                      'assets/broken.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
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
}
