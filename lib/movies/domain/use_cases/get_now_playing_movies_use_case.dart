import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';

class GetNowPlayingMoviesUseCase {
  final BaseMoviesRepository baseMovieRepository;

  GetNowPlayingMoviesUseCase(this.baseMovieRepository);
  Future<Either<Failure, List<Movie>>> excute() async {
    return await baseMovieRepository.getNowPlayingMovies();
  }
}
