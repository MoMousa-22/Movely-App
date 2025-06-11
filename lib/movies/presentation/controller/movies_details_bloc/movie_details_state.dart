import 'package:equatable/equatable.dart';

import '../../../../core/utils/enums.dart';
import '../../../domain/entities/movie_details.dart';
import '../../../domain/entities/recommendation.dart';

class MovieDetailsState extends Equatable {
  final MovieDetails? movieDetails;
  final RequestState movieDetailsState;
  final String movieDetailsErrorMessage;
  final List<Recommendation> recommendationMovies;
  final RequestState recommendationState;
  final String recommendationErrorMessage;

  const MovieDetailsState({
    this.movieDetails,
    this.movieDetailsState = RequestState.loading,
    this.movieDetailsErrorMessage = '',
    this.recommendationMovies = const [],
    this.recommendationState = RequestState.loading,
    this.recommendationErrorMessage = '',
  });

  MovieDetailsState copyWith({
    MovieDetails? movieDetails,
    RequestState? movieDetailsState,
    String? movieDetailsErrorMessage,
    List<Recommendation>? recommendationMovies,
    RequestState? recommendationState,
    String? recommendationErrorMessage,
  }) {
    return MovieDetailsState(
      movieDetails: movieDetails ?? this.movieDetails,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      movieDetailsErrorMessage:
          movieDetailsErrorMessage ?? this.movieDetailsErrorMessage,
      recommendationMovies: recommendationMovies ?? this.recommendationMovies,
      recommendationState: recommendationState ?? this.recommendationState,
      recommendationErrorMessage:
          recommendationErrorMessage ?? this.recommendationErrorMessage,
    );
  }

  @override
  List<Object?> get props => [
        movieDetails,
        movieDetailsState,
        movieDetailsErrorMessage,
        recommendationMovies,
        recommendationState,
        recommendationErrorMessage,
      ];
}
