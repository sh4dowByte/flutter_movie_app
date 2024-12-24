import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_movie_app/features/stream_movie/data/models/search_slug.dart';
import 'package:html/parser.dart' show parse;

class StreamService {
  late Dio dio;

  StreamService() {
    dio = Dio(
      BaseOptions(
        baseUrl: dotenv.env['STREAM_SEARCH_API_BASE_URL'] ?? '',
      ),
    );
  }

  // Fetch slugs from the API
  Future<List<SearchSlug>> fetchListSlug(String title) async {
    try {
      final response = await dio.get('', queryParameters: {
        's': title,
      });

      if (response.statusCode == 200) {
        final List slugList =
            response.data.isNotEmpty ? response.data['results'] : [];

        // Pisahkan kata-kata dalam title untuk keperluan filter
        // final keywords = title.split(' ');

        // Proses slug dan filter berdasarkan title yang cocok
        final results = await Future.wait(slugList.map((slugData) async {
          final slug = slugData['slug'] as String;
          final slugTitle = slugData['title'] as String;

          // Filter slugTitle berdasarkan keywords
          // final isMatch = keywords.every((keyword) =>
          //     slugTitle.toLowerCase().contains(keyword.toLowerCase()));

          // Jika tidak cocok, kembalikan null
          // if (!isMatch) return null;

          // Scrape links for each slug
          final response =
              await dio.get('${dotenv.env['STREAM_MOVIE_API_BASE_URL']}/$slug');
          final links = await _fetchLinks(response);
          final poster = await _fetchThumbnail(response);

          // Jika tidak ada link, kembalikan null
          if (links.isEmpty) return null;

          return SearchSlug(
              slug: slug, title: slugTitle, link: links, poster: poster ?? '');
        }));

        // Hapus null dari hasil
        return results.whereType<SearchSlug>().toList();
      } else {
        throw Exception('Failed to fetch popular slug');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Scrape links from a specific slug
  Future<List<Link>> _fetchLinks(Response response) async {
    final links = <Link>[];

    try {
      if (response.statusCode == 200) {
        final document = parse(response.data); // Parse HTML content
        final loadProviders = document.getElementById('loadProviders');

        if (loadProviders != null) {
          for (final element in loadProviders.getElementsByTagName('a')) {
            final name = element.text.trim();
            final url = element.attributes['href'] ?? '';

            if (url.isNotEmpty) {
              links.add(Link(name: name, url: url));
            }
          }
        }
        return links;
      } else {
        throw Exception('Failed to fetch slug page');
      }
    } catch (e) {
      throw Exception('Error scraping slug page: $e');
    }
  }

  Future<String?> _fetchThumbnail(Response response) async {
    try {
      if (response.statusCode == 200) {
        // Parse konten HTML
        final document = parse(response.data);

        // Cari elemen <picture>
        final pictureElement = document.querySelector('picture');

        if (pictureElement != null) {
          // Cari elemen <source> dengan type="image/webp"
          final sourceElement =
              pictureElement.querySelector('source[type="image/webp"]');

          // Jika elemen <source> ditemukan, ambil atribut srcset
          if (sourceElement != null) {
            return 'https:${sourceElement.attributes['srcset']}';
          }

          // Jika tidak ada elemen <source>, cari elemen <img> di dalam <picture>
          final imgElement = pictureElement.querySelector('img');
          if (imgElement != null) {
            return 'https:${imgElement.attributes['src']}';
          }
        }

        return null; // Thumbnail tidak ditemukan
      } else {
        throw Exception('Failed to fetch poster page');
      }
    } catch (e) {
      throw Exception('Error scraping thumbnail: $e');
    }
  }
}
