import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/details/getx/getx_details.dart';
import 'package:movie_app/details/models/details_model.dart';

class Details extends StatelessWidget {
  const Details({
    Key? key,
    required this.movieId,
  }) : super(key: key);

  final int movieId;

  @override
  Widget build(BuildContext context) {
    final detailsGetx = Get.find<DetailsGetx>();

    return Center(
      child: FutureBuilder(
          future: detailsGetx.getPopularGetx(movieId.toString()),
          builder:
              (BuildContext context, AsyncSnapshot<DetailsModel> snapshot) {
            if (!snapshot.hasData)
              // ignore: curly_braces_in_flow_control_structures
              return Container();

            if (snapshot.data!.title.isNotEmpty) {
              return _CustomBody(
                detail: snapshot.data!,
              );
            }
            return Container();
          }),
    );
  }
}

class _CustomBody extends StatelessWidget {
  const _CustomBody({
    Key? key,
    required this.detail,
  }) : super(key: key);
  final DetailsModel detail;
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Studio',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 20),
              Text(
                detail.productionCompanies.first.name,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Genre',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 23),
              Text(
                detail.genres.map((e) => e.name).toList().join(', '),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(width: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Release',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                detail.releaseDate.year.toString(),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
