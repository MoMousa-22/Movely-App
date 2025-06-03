import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/use_case/base_use_case.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/use_cases/get_now_playing_movies_use_case.dart';
import 'package:movies_app/movies/domain/use_cases/get_popular_movies_use_case.dart';
import 'package:movies_app/movies/domain/use_cases/get_top_rated_movies_use_case.dart';
import 'package:movies_app/movies/presentation/controller/movies_state.dart';

import 'movies_events.dart';

class MoviesBloc extends Bloc<MoviesEvents, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(this.getNowPlayingMoviesUseCase, this.getPopularMoviesUseCase,
      this.getTopRatedMoviesUseCase)
      : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);
    on<GetPopularMoviesEvent>(_getPopularMovies);
    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getNowPlayingMovies(
      GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getNowPlayingMoviesUseCase(const NoParameters());

    result.fold(
      (error) => emit(
        state.copyWith(
          nowPlayingState: RequestState.error,
          nowPlayingErrorMessage: error.message,
        ),
      ),
      (movies) => emit(state.copyWith(
        nowPlayingMovies: movies,
        nowPlayingState: RequestState.loaded,
      )),
    );
  }

  FutureOr<void> _getPopularMovies(
      GetPopularMoviesEvent event, Emitter<MoviesState> emit) async {
    {
      final result = await getPopularMoviesUseCase(const NoParameters());
      result.fold(
        (error) => emit(
          state.copyWith(
            popularState: RequestState.error,
            popularErrorMessage: error.message,
          ),
        ),
        (movies) => emit(
          state.copyWith(
            popularMovies: movies,
            popularState: RequestState.loaded,
          ),
        ),
      );
    }
  }

  FutureOr<void> _getTopRatedMovies(
      GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getTopRatedMoviesUseCase(const NoParameters());

    result.fold(
      (error) => emit(
        state.copyWith(
          topRatedState: RequestState.error,
          topRatedErrorMessage: error.message,
        ),
      ),
      (movies) => emit(
        state.copyWith(
          topRatedMovies: movies,
          topRatedState: RequestState.loaded,
        ),
      ),
    );
  }
}
