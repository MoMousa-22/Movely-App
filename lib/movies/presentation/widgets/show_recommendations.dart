import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/movies/presentation/widgets/empty_movie_details.dart';
import 'package:movies_app/movies/presentation/widgets/recommendation_movies.dart';

import '../controller/movie_details_bloc.dart';

Widget showRecommendations() {
  return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
    builder: (context, state) {
      final recommendations = state.recommendationMovies;
      if (recommendations.isEmpty) {
        return const EmptyMovieDetails();
      }
      return const RecommendationMovies();
    },
  );
}
