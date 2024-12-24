import 'package:flutter/material.dart';
import 'package:flutter_movie_app/features/people/presentation/notifier/tv_actor_notifier.dart';
import 'package:flutter_movie_app/features/tv/data/models/tv.dart';
import 'package:flutter_movie_app/features/tv/presentation/notifier/tv_airing_today_notifier.dart';
import 'package:flutter_movie_app/features/tv/presentation/notifier/tv_discover_notifier.dart';
import 'package:flutter_movie_app/features/tv/presentation/notifier/tv_on_the_air_notifier.dart';
import 'package:flutter_movie_app/features/tv/presentation/notifier/tv_popular_notifier.dart';
import 'package:flutter_movie_app/features/tv/presentation/notifier/tv_top_rated_notifier.dart';
import 'package:flutter_movie_app/features/tv/presentation/widgets/app_select_date.dart';
import 'package:flutter_movie_app/features/tv/presentation/widgets/app_tv_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class SeeMoreTvPage extends ConsumerStatefulWidget {
  final int? genreId;
  final int? actorId;
  final String? date;
  final String providerKey;
  final String title;
  const SeeMoreTvPage(this.title, this.providerKey,
      {this.genreId, this.actorId, this.date, super.key});

  @override
  ConsumerState<SeeMoreTvPage> createState() => SeeMoreTvPageState();
}

class SeeMoreTvPageState extends ConsumerState<SeeMoreTvPage> {
  final ScrollController _scrollControllerSearch = ScrollController();

  late final StateNotifierProvider<dynamic, AsyncValue<List<Tv>>> provider;

  @override
  void initState() {
    super.initState();

    // Tetapkan provider berdasarkan `providerKey`
    switch (widget.providerKey) {
      case 'popular':
        provider = popularTvProvider;
        break;
      case 'actor_tv':
        provider = actorTvProvider(widget.actorId!);
        break;
      case 'discover':
        provider = discoverTvProvider;
        break;
      case 'on_the_air':
        provider = onTheAirTvProvider;
        break;
      case 'top_rated':
        provider = topRatedTvProvider;
        break;
      case 'airing_today':
        provider = airingTvTodayProvider((widget.date!));
        break;
      default:
        throw Exception('Invalid providerKey: ${widget.providerKey}');
    }

    // Setup listener untuk pagination
    _scrollControllerSearch.addListener(() {
      if (_scrollControllerSearch.position.pixels >=
          _scrollControllerSearch.position.maxScrollExtent) {
        ref.read(provider.notifier).getNextPage();
      }
    });
  }

  @override
  void dispose() {
    _scrollControllerSearch.dispose();
    super.dispose();
  }

  List<String> generateWeekDates() {
    DateTime today = DateTime.now();

    // Mulai dari 3 hari sebelum hari ini
    DateTime startDate = today.subtract(const Duration(days: 3));

    // Buat daftar tanggal dari 3 hari sebelum hingga 3 hari setelah hari ini
    List<String> dates = List.generate(7, (index) {
      DateTime weekDay = startDate.add(Duration(days: index));
      return DateFormat('yyyy-MM-dd').format(weekDay);
    });

    return dates;
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(provider);

    return Scaffold(
      appBar: AppBar(
          title: Text(widget.title),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(widget.date == null ? 0 : 100),
            child: widget.date != null
                ? Container(
                    padding: const EdgeInsets.only(bottom: 20),
                    width: double.infinity,
                    child: AppSelectDate(
                      activeId: ref.read(provider.notifier)?.activeDate,
                      item: generateWeekDates(),
                      onChange: (date) async {
                        ref.read(provider.notifier).getInitial(dateToday: date);
                      },
                    ),
                  )
                : Container(),
          )),
      body: Column(
        children: [
          state.when(
            data: (data) => Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                controller: _scrollControllerSearch,
                itemCount: data.length +
                    (ref.read(provider.notifier).isLoadingNextPage ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index < data.length) {
                    final item = data[index];
                    return AppTvCoverTile(item: item);
                  } else {
                    return AppTvCoverTile.skeleton();
                  }
                },
              ),
            ),
            loading: () => Expanded(child: AppTvCoverTile.loading()),
            error: (error, stackTrace) => Center(child: Text('Error: $error')),
          ),
        ],
      ),
    );
  }
}
