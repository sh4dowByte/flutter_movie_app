import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/core/pallete.dart';
import 'package:flutter_movie_app/core/routes.dart';
import 'package:flutter_movie_app/core/utils/date_helper.dart';
import 'package:flutter_movie_app/core/utils/image_url_helper.dart';
import 'package:flutter_movie_app/core/widget/star_rating.dart';
import 'package:flutter_movie_app/core/widget/app_skeleton.dart';
import 'package:flutter_movie_app/features/tv/data/models/tv_detail.dart';

class AppSeasonCoverTile extends StatelessWidget {
  const AppSeasonCoverTile({
    super.key,
    required this.item,
    this.replaceRoute = false,
    required this.seriesId,
  });

  final Season item;
  final bool replaceRoute;
  final int seriesId;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      onTap: () {
        if (replaceRoute) {
          Navigator.pushReplacementNamed(context, Routes.tvSeasonDetail,
              arguments: {
                'seriesId': item.id,
                'seasonNumber': item.seasonNumber
              });
        } else {
          Navigator.pushNamed(context, Routes.tvSeasonDetail, arguments: {
            'seriesId': seriesId,
            'seasonNumber': item.seasonNumber
          });
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

            Positioned(
                right: 10,
                bottom: 0,
                child: Text(
                  '${item.episodeCount} Episodes',
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelSmall,
                )),

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
                    Text(
                      '${DateHelper.formatNormalDate(item.airDate ?? '')} ',
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    StarRating(
                      rating: item.voteAverage ?? 0,
                      starSize: 14,
                    ),
                    Text(
                      item.overview ?? '',
                      style: Theme.of(context).textTheme.labelSmall,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
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
                      size: ImageSize.posterW342),
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
