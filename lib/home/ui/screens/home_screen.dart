import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:movie_app/home/getx/getx_top_rated.dart';
import 'package:movie_app/home/models/top_rated_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final getxController = Get.find<TopRatedGetx>();
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
                      itemCount:
                          getxController.topRatedList.first.results.length,
                      itemBuilder: (_, int i) => _MoviePoster(
                        movie: getxController.topRatedList.first.results[i],
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
                          getxController.topRatedList.first.results.length,
                      itemBuilder: (_, int i) => _MoviePoster(
                        movie: getxController.topRatedList.first.results[i],
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

class _MoviePoster extends StatelessWidget {
  const _MoviePoster({
    Key? key,
    required this.movie,
  }) : super(key: key);
  final TopRatedData movie;
  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = new ScrollController();
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: FadeInImage(
              placeholder: const AssetImage('assets/no-image.jpg'),
              image: NetworkImage(movie.fullPathImg),
              width: 130,
              height: 170,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            movie.originalTitle,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
          RatingBar.builder(
            itemSize: 17,
            initialRating: movie.voteAverage / 2,
            allowHalfRating: true,
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (_, __) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {},
          ),
        ],
      ),
    );
  }
}

class CustomSearch extends StatelessWidget {
  const CustomSearch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: const TextStyle(fontSize: 16, color: Colors.white),
                  prefixIcon: const Icon(Icons.search, color: Colors.white),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
