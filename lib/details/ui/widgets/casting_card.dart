import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/details/getx/getx_credits.dart';
import 'package:movie_app/details/models/credits_model.dart';
import 'package:movie_app/details/ui/widgets/cast_card.dart';

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
              height: 120,
              child: ListView.builder(
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.cast.length,
                itemBuilder: (_, int index) =>
                    CastCard(cast: snapshot.data!.cast[index]),
              ),
            );
          }

          return Container();
        },
      ),
    );
  }
}
