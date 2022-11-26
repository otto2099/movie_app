import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:movie_app/details/ui/screens/details_screen.dart';
import 'package:movie_app/home/models/top_rated_model.dart';

class MoviePoster extends StatelessWidget {
  const MoviePoster({
    Key? key,
    required this.movie,
  }) : super(key: key);
  final TopRatedData movie;
  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => Get.toNamed('/details'),
            // onTap: () => Get.to(const DetailsScreen()),

            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'),
                image: NetworkImage(movie.fullPathImg),
                width: 130,
                height: 170,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: 130,
            height: 35,
            child: Text(
              movie.originalTitle,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
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
