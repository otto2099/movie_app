import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/home/getx/getx_top_rated.dart';
import 'package:movie_app/home/models/top_rated_model.dart';
import 'package:movie_app/home/ui/screens/home_screen.dart';

class CheckScreen extends StatelessWidget {
  const CheckScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final topRatedController = Get.find<TopRatedGetx>();
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: topRatedController.getTopRatedGetx(),
          builder: (BuildContext context, AsyncSnapshot<MovieModel> snapshot) {
            if (!snapshot.hasData)
              // ignore: curly_braces_in_flow_control_structures
              return const CircularProgressIndicator(
                  backgroundColor: Color.fromRGBO(39, 47, 61, 5));

            if (snapshot.data!.results.isNotEmpty) {
              Future.microtask((() {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => const HomeScreen(),
                    transitionDuration: const Duration(seconds: 0),
                  ),
                );
              }));
            }

            return Container();
          },
        ),
      ),
    );
  }
}
