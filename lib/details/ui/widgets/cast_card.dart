import 'package:flutter/material.dart';
import 'package:movie_app/details/models/credits_model.dart';

class CastCard extends StatelessWidget {
  final Cast cast;

  const CastCard({required this.cast});

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
