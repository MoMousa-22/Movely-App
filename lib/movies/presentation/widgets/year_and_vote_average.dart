import 'package:flutter/material.dart';

import 'movie_data.dart';

class YearAndVoteAverageWidget extends StatelessWidget {
  final String date;
  final String voteAverage;
  const YearAndVoteAverageWidget({
    super.key,
    required this.date,
    required this.voteAverage,
  });

  @override
  Widget build(BuildContext context) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          createMovieDate(context: context, data: getYear(date)),
          const SizedBox(width: 10),
          const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          createVoteAverage(context, voteAverage),
        ],
      );
}
