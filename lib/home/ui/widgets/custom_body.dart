import 'package:flutter/material.dart';
import 'package:movie_app/home/getx/getx_popular.dart';
import 'package:movie_app/home/getx/getx_top_rated.dart';
import 'package:movie_app/home/ui/widgets/movie_poster.dart';

class CustomBody extends StatelessWidget {
  const CustomBody({
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
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
        child: Container(
          width: double.infinity,
          color: const Color.fromRGBO(39, 47, 61, 5),
          child: Column(
            children: [
              const SizedBox(height: 10),
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
      ),
    );
  }
}
