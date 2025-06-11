import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/data_source/movie_remote_data_source.dart';
import 'package:movies_app/movies/data/repository/movies_repository.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';
import 'package:movies_app/movies/domain/use_cases/get_movies_details_use_case.dart';
import 'package:movies_app/movies/domain/use_cases/get_now_playing_movies_use_case.dart';
import 'package:movies_app/movies/domain/use_cases/get_popular_movies_use_case.dart';
import 'package:movies_app/movies/domain/use_cases/get_recommendation_use_case.dart';
import 'package:movies_app/movies/domain/use_cases/get_top_rated_movies_use_case.dart';
import 'package:movies_app/movies/presentation/controller/movies_details_bloc/movie_details_bloc.dart';
import 'package:movies_app/movies/presentation/controller/movies_bloc/movies_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    /// Bloc
    sl.registerFactory(
      () => MoviesBloc(
        sl(),
        sl(),
        sl(),
      ),
    );
    sl.registerFactory(
      () => MovieDetailsBloc(
        sl(),
        sl(),
      ),
    );

    /// Use Cases
    sl.registerLazySingleton<GetNowPlayingMoviesUseCase>(
        () => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton<GetPopularMoviesUseCase>(
        () => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton<GetTopRatedMoviesUseCase>(
        () => GetTopRatedMoviesUseCase(sl()));

    sl.registerLazySingleton<GetMoviesDetailsUseCase>(
        () => GetMoviesDetailsUseCase(sl()));
    sl.registerLazySingleton<GetRecommendationUseCase>(
        () => GetRecommendationUseCase(sl()));

    /// Repository
    sl.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRepository(sl()));

    /// Data Source
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}
