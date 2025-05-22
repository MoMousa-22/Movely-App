import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repository.dart';

class GetNowPlayingMoviesUseCase {
  final BaseMovieRepository baseMovieRepository;

  GetNowPlayingMoviesUseCase(this.baseMovieRepository);
  Future<List<Movie>> excute() async {
    return await baseMovieRepository.getNowPlayingMovies();
  }
}
