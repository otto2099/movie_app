import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:movie_app/home/getx/getx_popular.dart';
import 'package:movie_app/home/getx/getx_search.dart';
import 'package:movie_app/home/getx/getx_top_rated.dart';
import 'package:movie_app/home/models/top_rated_model.dart';
import 'package:movie_app/home/ui/widgets/movie_items.dart';

import 'package:movie_app/home/ui/widgets/movie_poster.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final topRatedController = Get.find<TopRatedGetx>();
  final popularController = Get.find<PopularGetx>();
  final searchService = Get.find<SearchGetx>();

  TextEditingController searchController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  bool searchActive = false;
  @override
  void initState() {
    popularController.onInit();
    topRatedController.onInit();
    setState(() {});
    super.initState();
  }

  showWidget() {
    if (searchActive) {
      print(searchController.text);
      return Expanded(
        child: StreamBuilder(
          stream: searchService.suggestionStream,
          builder: (_, AsyncSnapshot<MovieModel> snapshot) {
            if (!snapshot.hasData) return Container();
            final movies = snapshot.data!;

            return ListView.builder(
                itemCount: movies.results.length,
                itemBuilder: (_, int i) => MovieItem(movies.results[i]));
          },
        ),
      );
    } else {
      return _CustomBody(
          scrollController: scrollController,
          popularController: popularController,
          topRatedController: topRatedController);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromRGBO(95, 161, 209, 10),
        title: const Text(''),
      ),
      body: Column(
        children: [
          Container(
            // 95	161	209
            color: const Color.fromRGBO(95, 161, 209, 10),
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    const Text(
                      'Hello, whatdo you want to watch ?',
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: searchController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle:
                            const TextStyle(fontSize: 16, color: Colors.white),
                        prefixIcon:
                            const Icon(Icons.search, color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        contentPadding: const EdgeInsets.all(16),
                      ),
                      onChanged: (value) {
                        if (value.isEmpty) {
                          searchActive = false;
                          setState(() {});
                        } else {
                          searchService.getSuggestionsByQuery(value);
                          searchActive = true;
                          setState(() {});
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          // 39	47	61
          showWidget()
          // _CustomBody(
          //     scrollController: scrollController,
          //     popularController: popularController,
          //     topRatedController: topRatedController)
        ],
      ),
    );
  }
}

class _CustomBody extends StatelessWidget {
  const _CustomBody({
    Key? key,
    required this.scrollController,
    required this.popularController,
    required this.topRatedController,
  }) : super(key: key);

  final ScrollController scrollController;
  final PopularGetx popularController;
  final TopRatedGetx topRatedController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        color: const Color.fromRGBO(39, 47, 61, 5),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  'RECOMENED FOR YOU ',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'See all',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ))
              ],
            ),
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: popularController.popular.first.results.length,
                itemBuilder: (_, int i) => MoviePoster(
                  movie: popularController.popular.first.results[i],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  'TOP RATED ',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'See all',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ))
              ],
            ),
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: topRatedController.topRatedList.first.results.length,
                itemBuilder: (_, int i) => MoviePoster(
                  movie: topRatedController.topRatedList.first.results[i],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
