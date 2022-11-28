import 'package:flutter/material.dart';
import 'package:movie_app/home/models/top_rated_model.dart';

class CustomOverview extends StatelessWidget {
  final TopRatedData movie;

  const CustomOverview({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Text(
        movie.overview,
        textAlign: TextAlign.justify,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
