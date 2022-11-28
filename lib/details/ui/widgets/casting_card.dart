import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/details/getx/getx_credits.dart';
import 'package:movie_app/details/models/credits_model.dart';

class CastingCard extends StatelessWidget {
  final int movieId;
  // ignore: use_key_in_widget_constructors
  const CastingCard({
    required this.movieId,
  });

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    final moviesProvider = Get.find<CreditsGetx>();
    return Center(
      child: FutureBuilder(
        future: moviesProvider.getPopularGetx(movieId.toString()),
        builder: (BuildContext context, AsyncSnapshot<CreditsModel> snapshot) {
          if (!snapshot.hasData)
            // ignore: curly_braces_in_flow_control_structures
            return const CircularProgressIndicator(
                backgroundColor: Color.fromRGBO(39, 47, 61, 5));

          if (snapshot.data!.cast.isNotEmpty) {
            return SizedBox(
              height: 200,
              child: ListView.builder(
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.cast.length,
                itemBuilder: (_, int index) =>
                    _CastCard(cast: snapshot.data!.cast[index]),
              ),
            );
          }

          return Container();
        },
      ),
    );
  }
}

class _CastCard extends StatelessWidget {
  final Cast cast;

  const _CastCard({required this.cast});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(cast.fullProfilePath),
          ),
          const SizedBox(height: 10),
          Text(
            cast.name,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
