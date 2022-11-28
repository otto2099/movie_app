import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/details/getx/getx_credits.dart';
import 'package:movie_app/details/ui/widgets/casting_card.dart';
import 'package:movie_app/details/ui/widgets/custom__overview.dart';
import 'package:movie_app/details/ui/widgets/custom_app_bar.dart';
import 'package:movie_app/details/ui/widgets/custom_title.dart';
import 'package:movie_app/home/models/top_rated_model.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final creditsController = Get.find<CreditsGetx>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TopRatedData movie = Get.arguments as TopRatedData;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(39, 47, 61, 5),
      body: CustomScrollView(
        slivers: [
          CustomAppBar(
            movie: movie,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                CustomTitle(
                  movie: movie,
                ),
                CustomOverview(
                  movie: movie,
                ),
                CastingCard(
                  movieId: movie.id,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
