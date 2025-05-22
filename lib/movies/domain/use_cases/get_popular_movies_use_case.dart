import '../entities/movie.dart';
import '../repository/base_movie_repository.dart';

class GetPopularMoviesUseCase {
  final BaseMovieRepository baseMovieRepository;

  GetPopularMoviesUseCase(this.baseMovieRepository);
  Future<List<Movie>> excute() async {
    return await baseMovieRepository.getPopularMovies();
  }
}
