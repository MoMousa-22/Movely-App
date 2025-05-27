import 'package:equatable/equatable.dart';
import 'package:movies_app/core/utils/enums.dart';

import '../../domain/entities/movie.dart';

class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingState;
  final String nowPlayingErrorMessage;

  MoviesState({
    this.nowPlayingMovies = const [],
    this.nowPlayingState = RequestState.loading,
    this.nowPlayingErrorMessage = '',
  });

  @override
  List<Object> get props =>
      [nowPlayingMovies, nowPlayingState, nowPlayingErrorMessage];
}
