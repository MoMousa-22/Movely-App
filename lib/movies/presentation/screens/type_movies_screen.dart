import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/network/constants/api_constants.dart';
import '../../../core/services/services_locator.dart';
import '../../domain/entities/movie.dart';
import '../controller/movies_bloc/movies_bloc.dart';
import '../widgets/movie_data.dart';

class TypeMoviesScreen extends StatelessWidget {
  final List<Movie> movies;
  final String moviesType;
  const TypeMoviesScreen({
    super.key,
    required this.movies,
    required this.moviesType,
  });

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => sl<MoviesBloc>(),
        child: Scaffold(
          appBar: AppBar(title: Text(moviesType)),
          body: ListView.builder(
            itemBuilder: (context, index) =>
                _createMovieItem(movies[index], context),
            itemCount: movies.length,
          ),
        ),
      );

  Widget _createMovieItem(Movie movie, BuildContext context) => Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: _createDecoration(),
        child: _createContentItem(movie: movie, context: context),
      );

  BoxDecoration _createDecoration() => BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.grey.shade800,
      );
  Row _createContentItem({
    required Movie movie,
    required BuildContext context,
  }) =>
      Row(
        children: [
          CachedNetworkImage(
            width: 90,
            height: 140,
            fit: BoxFit.cover,
            imageUrl: ApiConstants.imageUrl(movie.backdropPath),
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: Colors.grey[700]!,
              highlightColor: Colors.grey[800]!,
              child: Container(
                height: 100,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          const SizedBox(width: 10),
          MovieDataWidget(movie: movie),
        ],
      );
}
