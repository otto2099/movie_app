import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:movie_app/home/getx/getx_popular.dart';
import 'package:movie_app/home/getx/getx_top_rated.dart';

import 'package:movie_app/home/ui/widgets/custom_search.dart';
import 'package:movie_app/home/ui/widgets/movie_poster.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final topRatedController = Get.find<TopRatedGetx>();
    final popularController = Get.find<PopularGetx>();

    final ScrollController scrollController = ScrollController();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromRGBO(95, 161, 209, 10),
        title: const Text(''),
      ),
      body: Column(
        children: [
          const CustomSearch(),
          // 39	47	61
          Expanded(
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
                      itemCount:
                          topRatedController.topRatedList.first.results.length,
                      itemBuilder: (_, int i) => MoviePoster(
                        movie: topRatedController.topRatedList.first.results[i],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
