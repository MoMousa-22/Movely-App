import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/movies/presentation/controller/movies_details_bloc/movie_details_bloc.dart';
import 'package:movies_app/movies/presentation/controller/movies_details_bloc/movie_details_state.dart';
import 'package:movies_app/movies/presentation/widgets/empty_movie_details.dart';
import 'package:movies_app/movies/presentation/widgets/recommendation_movies.dart';

Widget showRecommendations() {
  return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
    builder: (context, state) {
      final recommendations = state.recommendationMovies;
      if (recommendations.isNotEmpty) {
        return const RecommendationMovies();
      } else {
        return const EmptyMovieDetails();
      }

      // switch (state.recommendationState) {
      //   case RequestState.loading:
      //     return const CircularProgressIndicator(
      //       color: Colors.red,
      //     );
      //   case RequestState.loaded:
      //     return const RecommendationMovies();
      //   case RequestState.error:
      //     return const CircularProgressIndicator(
      //       color: Colors.amber,
      //     );
      // }
    },
  );
}
