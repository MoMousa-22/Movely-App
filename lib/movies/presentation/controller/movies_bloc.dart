import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/data/data_source/movie_remote_data_source.dart';
import 'package:movies_app/movies/data/repository/movies_repository.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';
import 'package:movies_app/movies/domain/use_cases/get_now_playing_movies_use_case.dart';
import 'package:movies_app/movies/presentation/controller/movies_state.dart';

import 'movies_events.dart';

class MoviesBloc extends Bloc<MoviesEvents, MoviesState> {
  MoviesBloc() : super(MoviesState()) {
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      BaseMovieRemoteDataSource baseMovieRemoteDataSource =
          MovieRemoteDataSource();
      print(baseMovieRemoteDataSource.hashCode);
      BaseMoviesRepository baseMoviesRepository =
          MoviesRepository(baseMovieRemoteDataSource);
      print(baseMoviesRepository.hashCode);
      final result =
          await GetNowPlayingMoviesUseCase(baseMoviesRepository).excute();

      emit(MoviesState(nowPlayingState: RequestState.loaded));
      result.fold(
          (l) => emit(MoviesState(
              nowPlayingState: RequestState.error,
              nowPlayingErrorMessage: l.message)),
          (r) => emit(MoviesState(
              nowPlayingMovies: r, nowPlayingState: RequestState.loaded)));
    });
  }
}
