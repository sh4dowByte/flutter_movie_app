import 'package:flutter/material.dart';
import 'package:flutter_movie_app/features/favorite/presentation/screens/movie.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TabBar(
          indicatorColor: Colors.pink,
          labelColor: Colors.pink,
          isScrollable: true,
          tabAlignment: TabAlignment.center,
          dividerColor: Colors.transparent,
          controller: _tabController,
          tabs: const [
            Tab(text: 'Movie'),
            Tab(text: 'Tv Series'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          MovieFavoritePage(),
          Center(child: Text('Tv Series')),
        ],
      ),
    );
  }
}
