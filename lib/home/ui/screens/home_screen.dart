import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:movie_app/home/getx/getx_popular.dart';
import 'package:movie_app/home/getx/getx_search.dart';
import 'package:movie_app/home/getx/getx_top_rated.dart';
import 'package:movie_app/home/models/top_rated_model.dart';
import 'package:movie_app/home/ui/widgets/custom_body.dart';
import 'package:movie_app/home/ui/widgets/movie_items.dart';

import 'package:movie_app/theme/app_theme.dart';
import 'package:movie_app/theme/change_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final topRatedController = Get.find<TopRatedGetx>();
  final popularController = Get.find<PopularGetx>();
  final theme = Get.find<ChangeTheme>();

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
      return CustomBody(
          scrollController: scrollController,
          popularController: popularController,
          topRatedController: topRatedController);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        actions: [
          Row(
            children: [
              const Text('Light Mode'),
              Switch(
                value: theme.isDark,
                onChanged: (value) {
                  Get.changeTheme(
                      value ? AppTheme.lightTheme : AppTheme.darkTheme);
                  theme.changeTheme(value);
                  setState(() {});
                },
              ),
            ],
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    const Text(
                      'Hello, what do you want to watch ?',
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
          showWidget()
        ],
      ),
    );
  }
}
