import 'package:flutter_movie_app/features/movie/data/models/movie.dart';
import 'package:flutter_movie_app/features/movie/data/models/movie_detail.dart';

final testMovieDetail = MovieDetail.fromJson({
  "adult": false,
  "backdrop_path": "/9Qq8InnodUYs8zdam8Zj967i6RO.jpg",
  "belongs_to_collection": null,
  "budget": 30000000,
  "genres": [
    {"id": 80, "name": "Crime"},
    {"id": 18, "name": "Drama"}
  ],
  "homepage": "https://www.warnerbros.com/movies/juror-2",
  "id": 1106739,
  "imdb_id": "tt27403986",
  "origin_country": ["US"],
  "original_language": "en",
  "original_title": "Juror #2",
  "overview":
      "While serving as a juror in a high profile murder trial, family man Justin Kemp finds himself struggling with a serious moral dilemma…one he could use to sway the jury verdict and potentially convict—or free—the accused killer.",
  "popularity": 644.437,
  "poster_path": "/ugQkpGajKFQ8eyOEhGheR0HfWQ.jpg",
  "production_companies": [
    {
      "id": 174,
      "logo_path": "/zhD3hhtKB5qyv7ZeL4uLpNxgMVU.png",
      "name": "Warner Bros. Pictures",
      "origin_country": "US"
    },
    {
      "id": 171,
      "logo_path": "/bqLWwuNCHcY3IjB5e4o29h7l80D.png",
      "name": "Malpaso Productions",
      "origin_country": "US"
    },
    {
      "id": 225128,
      "logo_path": null,
      "name": "Dichotomy Films",
      "origin_country": "US"
    }
  ],
  "production_countries": [
    {"iso_3166_1": "US", "name": "United States of America"}
  ],
  "release_date": "2024-10-30",
  "revenue": 18791698,
  "runtime": 114,
  "spoken_languages": [
    {"english_name": "English", "iso_639_1": "en", "name": "English"}
  ],
  "status": "Released",
  "tagline": "Justice is blind. Guilt sees everything.",
  "title": "Juror #2",
  "video": false,
  "vote_average": 6.983,
  "vote_count": 574
});

final testMovie = Movie.fromJson({
  "backdrop_path": "/3V4kLQg0kSqPLctI5ziYWabAZYF.jpg",
  "id": 912649,
  "title": "Venom: The Last Dance",
  "original_title": "Venom: The Last Dance",
  "overview":
      "Eddie and Venom are on the run. Hunted by both of their worlds and with the net closing in, the duo are forced into a devastating decision that will bring the curtains down on Venom and Eddie's last dance.",
  "poster_path": "/aosm8NMQ3UyoBVpSxyimorCQykC.jpg",
  "media_type": "movie",
  "adult": false,
  "original_language": "en",
  "genre_ids": [28, 878, 12],
  "popularity": 13535.697,
  "release_date": "2024-10-22",
  "video": false,
  "vote_average": 6.487,
  "vote_count": 1061
});
