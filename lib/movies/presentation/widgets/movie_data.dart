import 'package:flutter/material.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/presentation/widgets/year_and_vote_average.dart';

class MovieDataWidget extends StatelessWidget {
  final Movie movie;
  const MovieDataWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _createMovieName(context: context, movieName: movie.title),
          const SizedBox(height: 10),
          YearAndVoteAverageWidget(
            date: movie.releaseDate,
            voteAverage: movie.voteAverage.toString(),
          ),
          const SizedBox(height: 5),
          _createOverview(context, movie.overview),
        ],
      );
}

Widget _createMovieName({
  required BuildContext context,
  required String movieName,
}) =>
    SizedBox(
      width: 180,
      child: Text(
        movieName,
        style: Theme.of(context).textTheme.labelLarge,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      ),
    );

Widget _createOverview(BuildContext context, String overview) => SizedBox(
      width: 190,
      child: Text(
        overview,
        style: Theme.of(context).textTheme.bodySmall,
        overflow: TextOverflow.ellipsis,
        maxLines: 4,
      ),
    );

Widget createMovieDate({
  required BuildContext context,
  required String data,
}) =>
    Container(
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(data, style: Theme.of(context).textTheme.labelSmall),
    );

Widget createVoteAverage(BuildContext context, String voteAverage) =>
    Text(voteAverage, style: Theme.of(context).textTheme.labelLarge);

String getYear(String date) => date.substring(0, 10);
