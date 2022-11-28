import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:movie_app/home/models/top_rated_model.dart';

class MovieItem extends StatelessWidget {
  final TopRatedData movie;

  const MovieItem(this.movie);
  @override
  Widget build(BuildContext context) {
    // movie.heroId = 'searh-${movie.id}';
    return ListTile(
      leading: FadeInImage(
        image: NetworkImage(movie.fullPathImg),
        placeholder: const AssetImage('assets/no-image.jpg'),
        width: 50,
        fit: BoxFit.contain,
      ),
      title: Text(movie.title),
      subtitle: Text(movie.originalTitle),
      onTap: () {
        Get.toNamed('/details', arguments: movie);
      },
    );
  }
}
