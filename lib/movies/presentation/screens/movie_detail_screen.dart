import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/services/services_locator.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/presentation/controller/movies_details_bloc/movie_details_bloc.dart';
import 'package:movies_app/movies/presentation/controller/movies_details_bloc/movie_details_event.dart';
import 'package:movies_app/movies/presentation/controller/movies_details_bloc/movie_details_state.dart';
import 'package:movies_app/movies/presentation/widgets/details_image_sliver_appbar.dart';
import 'package:movies_app/movies/presentation/widgets/details_text_sliver.dart';
import 'package:movies_app/movies/presentation/widgets/loading_indicator.dart';
import 'package:movies_app/movies/presentation/widgets/more_like_this_text.dart';
import 'package:movies_app/movies/presentation/widgets/show_recommendations.dart';

class MovieDetailScreen extends StatelessWidget {
  final int id;

  const MovieDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MovieDetailsBloc>()
        ..add(
          GetMovieDetailsEvent(id),
        )
        ..add(
          GetMovieRecommendationEvent(id),
        ),
      child: const Scaffold(
        body: MovieDetailContent(),
      ),
    );
  }
}

class MovieDetailContent extends StatelessWidget {
  const MovieDetailContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      builder: (context, state) {
        switch (state.movieDetailsState) {
          case RequestState.loading:
            return const LoadingIndicator();
          case RequestState.loaded:
            return CustomScrollView(
              key: const Key('movieDetailScrollView'),
              slivers: [
                const DetailsImageSliverAppbar(),
                const DetailsTextSliver(),
                const MoreLikeThisText(),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 24.0),
                  sliver: showRecommendations(),
                ),
              ],
            );
          case RequestState.error:
            return Center(child: Text(state.movieDetailsErrorMessage));
        }
      },
    );
  }
}
